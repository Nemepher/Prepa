#load "graphics.cma";;
#load "unix.cma";;

Graphics.open_graph "" ;; 
let pause () = let _ = Unix.select [] [] [] 0.25 in ();;

let dessine_case (i,j) pas couleur = 
        Graphics.set_color couleur;
        Graphics.fill_rect i j pas pas
;;

let dimensions tableau = ( Array.length tableau, Array.length tableau.(0));;

let dessine_labyrinthe a pas = 
        let n,p = dimensions a in
        for i = 0 to n-1 do
                for j =0 to p-1 do 
                        let dessine = dessine_case (i*pas,j*pas) pas in 
                                if a.(i).(j) then dessine Graphics.white
                                else dessine Graphics.blue
                done
        done
;;

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
                
                dessine_labyrinthe a 20;
                if c_min < c then  mur_horizontal a l_min l_max c_min (c-1);
                if c_max > c then  mur_horizontal a l_min l_max (c+1) c_max 
        )
;;

let cree_labyrinthe n p = let a = Array.make_matrix n p true in mur_horizontal a 0 (n-1) 0 (p-1); a;;

let impasse position b = let (l,c) = dimensions b and (x,y) = position in 
        for i = max 0 (x-1) to min (l-1) (x+1) do 
                for j = max 0 (y-1) to min (c-1) (y+1) do 
                        if (i!=x && j!=y && b.(i).(j)) then false
                done
        done;
        true
;; 
(*
let suivant position b = let (l,c) = dimensions b and (x,y) = position in 
        for i = max 0 (x-1) to min (l-1) (x+1) do 
                for j = max 0 (y-1) to min (c-1) (y+1) do 
                        if i<>x && j<>y && b.(i).(j) then 5
                done
        done;
        3
;; 
*)

let a = cree_labyrinthe 60 60;;
dessine_labyrinthe a 10;;
Unix.sleep 2;;


