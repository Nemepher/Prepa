#load "graphics.cma";;
#load "unix.cma";;

Graphics.open_graph "";; 
Random.self_init ();; (* Il est nécessaire de seeder pour obtenir des labyrinthes différents *)
let pause () = let _ = Unix.select [] [] [] 0.08 in ();;


(* fonctions utiles *)

let dimensions tableau = ( Array.length tableau, Array.length tableau.(0) );;

let copie_tableau tableau = let (l,c) = dimensions tableau in 
        let resultat = Array.make_matrix l c tableau.(0).(0) in  
        for i = 0 to l-1 do 
                resultat.(i) <- Array.copy tableau.(i) 
        done;
        resultat
;;

let dessine_case (i,j) pas couleur = 
        Graphics.set_color couleur;
        Graphics.fill_rect (i*pas) (j*pas) pas pas
;;

let dessine_rond (i,j) pas couleur =
        Graphics.set_color couleur;
        Graphics.fill_circle (i*pas + pas/2) (j*pas + pas/2) (pas/4)
;;

let dessine_labyrinthe a pas = 
        let n,p = dimensions a in
        for i = 0 to n-1 do
                for j =0 to p-1 do 
                        let dessine = dessine_case (i,j) pas in 
                                if a.(i).(j) then dessine Graphics.white
                                else dessine Graphics.blue
                done
        done
;;


(* definition de la pile: version sans probleme de longueur *)

type 'a pile = 'a list ref;;

let cree_pile () = (ref [] : 'a pile);;

let empile x pile = pile:=x::!pile;;

let depile pile = match !pile with 
        []       -> failwith "pile vide"
      | a::suite -> pile:=suite; a
;;

let est_vide pile = match !pile with 
        []      -> true
      | _       -> false 
;; 

let tete pile = match !pile with 
        []       -> failwith "pile vide"
      | a::suite -> a
;;


(* definition de la file *)

type 'a file = {mutable entree: int; mutable sortie: int; objet: 'a array};;

let cree_file n a = {entree=n; sortie=n; objet = Array.make (n+1) a};;


let enfile x file = let n = Array.length file.objet in if (file.entree-file.sortie-1) mod n = 0  then failwith "file pleine" else ( 
        file.objet.(file.entree) <- x;
        file.entree <- (n + file.entree - 1) mod n;

)
;;

let defile file = let n = Array.length file.objet in if file.entree=file.sortie then failwith "file vide" else (
        let x = file.objet.(file.sortie) in 
                file.sortie <- (n + file.sortie - 1) mod n;
                x
)
;;

let file_vide file = file.entree=file.sortie;;

let tete_file file = file.objet.(file.sortie);;


(* génération de labyrinthe: version double recursivité *) 

let pair a = a mod 2 = 0;;

let alea_pair a b = if a=b then (if pair a then a else -1) else let c = ref (a + Random.int (b-a)) in
        if not (pair !c) then incr c;
        !c
;;

let alea_impair a b = if a=b then (if pair a then -1 else a) else let c = ref (a + Random.int (b-a)) in 
        if pair !c then incr c;
        !c
;;

let rec mur_horizontal a l_min l_max c_min c_max = let l = alea_impair l_min l_max and c = alea_pair c_min c_max in
        if l != -1 && c != -1 then (
                for i = c_min to c_max do
                        a.(l).(i) <- false
                done;
                a.(l).(c) <- true;
                
                pause ();
                dessine_labyrinthe a 20;

                if l_min < l then  mur_vertical a l_min (l-1) c_min c_max;
                if l_max > l then  mur_vertical a (l+1) l_max c_min c_max 
        )

and mur_vertical a l_min l_max c_min c_max  = let l = alea_pair l_min l_max and c = alea_impair c_min c_max in
        if l != -1 && c != -1 then (
                for i = l_min to l_max do
                        a.(i).(c) <- false
                done;
                a.(l).(c) <- true;

                pause ();
                dessine_labyrinthe a 20;
                
                if c_min < c then  mur_horizontal a l_min l_max c_min (c-1);
                if c_max > c then  mur_horizontal a l_min l_max (c+1) c_max 
        )
;;

let cree_labyrinthe n p = let a = Array.make_matrix n p true in mur_horizontal a 0 (n-1) 0 (p-1); a;;


(* parcours de labyrinthes *)

let impasse position b = let (l,c) = dimensions b and (x,y) = position in 
        let l1, l2, c1, c2 = max 0 (x-1), min (l-1) (x+1), max 0 (y-1), min (c-1) (y+1) in 
        not ( b.(l1).(y)  || b.(l2).(y)  || b.(x).(c1)  || b.(x).(c2)  )
;;

let suivant position b = let (l,c) = dimensions b and (x,y) = position in
        let l1, l2, c1, c2 = max 0 (x-1), min (l-1) (x+1), max 0 (y-1), min (c-1) (y+1) in 
        if b.(l1).(y) then (l1,y) else
        if b.(l2).(y) then (l2,y) else
        if b.(x).(c1) then (x,c1) else
        if b.(x).(c2) then (x,c2) else
        failwith "impasse"
;;

let visite position b = let (x,y) = position in b.(x).(y) <- false;;

(* versions itératives *)

let explore a depart arrive = let b = copie_tableau a and pile = cree_pile () and chemin = ref [] in 
        empile depart pile;
        visite depart b;
        while not (est_vide pile) && tete pile <> arrive do 
                let position = tete pile in 
                        if impasse position b then let _ = depile pile in () else (
                                let objectif = suivant position b in 
                                visite objectif b;
                                empile objectif pile; 
                                chemin := objectif :: !chemin;
                        )
        done;
        if est_vide pile then failwith "enferme" else arrive::!chemin
;;     



let explore_graphique a depart arrive = let b = copie_tableau a and pile = cree_pile () and chemin = ref [] in
        dessine_labyrinthe a 20;
        empile depart pile;
        visite depart b;
        while not (est_vide pile) && tete pile <> arrive do 
                pause ();
                let position = tete pile in 
                        dessine_case position 20 Graphics.red;
                        if impasse position b then let _ = depile pile in () else (
                                dessine_rond position 20 Graphics.white;
                                let objectif = suivant position b in 
                                visite objectif b;
                                empile objectif pile; 
                                chemin := objectif :: !chemin;
                        )
        done;
        if est_vide pile then failwith "enferme" else arrive::!chemin
;; 



let explore_limite a depart arrive q = let b = copie_tableau a and pile = cree_pile () and chemin = ref [] and i = ref 0 in 
        empile depart pile;
        visite depart b;
        while not (est_vide pile) && tete pile <> arrive do 
                let position = tete pile in 
                        if impasse position b || !i>q then let _ = depile pile in decr i else (
                                let objectif = suivant position b in 
                                visite objectif b;
                                empile objectif pile; 
                                chemin := objectif :: !chemin;
                                incr i;
                        )
        done;
        if est_vide pile then failwith "enferme" else arrive::!chemin
;;


(* version récursive *)

let rec explore_graphique_aux b pile chemin arrive =         
        pause ();
        if est_vide pile then failwith "enfermé" else ( 
                let position = depile pile in if position = arrive then arrive::!chemin else ( 
                        dessine_case position 20 Graphics.red;
                        if not (impasse position b) then (
                                dessine_rond position 20 Graphics.white;
                                let objectif = suivant position b in 
                                        visite objectif b;
                                        empile position pile;
                                        empile objectif pile; 
                                        chemin := objectif :: !chemin;
                        );
                        explore_graphique_aux b pile chemin arrive
                )        
        )
;; 

let explore_graphique_rec a depart arrive = let b = copie_tableau a and pile = cree_pile () and chemin = ref [] in
        dessine_labyrinthe a 20;
        empile depart pile;
        visite depart b;
        explore_graphique_aux b pile chemin arrive 
;;


let a = cree_labyrinthe 20 20;;
explore_graphique a (0,0) (10,10);;

Unix.sleep 8;;


