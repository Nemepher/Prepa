let graphe = Array.make_matrix 5 5 false;;
graphe.(0).(4) <-true;; 
graphe.(4).(0) <-true;;
graphe.(2).(4) <-true;; 
graphe.(4).(2) <-true;; 
graphe.(1).(4) <-true;; 
graphe.(4).(1) <-true;; 
graphe.(1).(3) <-true;; 
graphe.(3).(1) <-true;; 
graphe.(0).(3) <-true;; 
graphe.(3).(0) <-true;;
graphe;;

let graphe = [|
             [|false;false;true;true;false|];
             [|false;false;false;true;true|];
             [|true;false;false;false;true|];
             [|true;true;false;false;false|];
             [|false;true;true;false;false|]
             |];;


let etiquette = [|0;0;0;1;1|]

let est_col gphe etiq = let n = Array.length gphe and defaut = ref false in 
        for i = 0 to n-1 do
                for j = 0 to n-1 do
                        defaut := (i<>j && gphe.(i).(j) && etiq.(i) = etiq.(j)) || !defaut
                done
        done;
        not !defaut
;;

est_col graphe etiquette;;

let rec deux_col_aux gphe x etiq v n = 
        let v2 = (v+1) mod 2 and col = ref true and i = ref 0 in 
        etiq.(x) <- v;
        while !i<>n && !col do if gphe.(x).(!i) then (
                if etiq.(!i) = -1 then col:= deux_col_aux gphe !i etiq v2 n;
                if etiq.(!i) = v && !i<>x then col := false

        );
        incr i;
        done;
        !col
;; 

let deux_col gphe = let n = Array.length gphe.(0) in 
        let etiq = Array.make n (-1) and i = ref 0 and col = ref true in
        while !i<>n && !col do  
                if etiq.(!i) = -1 then col := deux_col_aux gphe !i etiq 0 n;
                incr i 
        done;
        if !col then etiq else [||]
;;

let rec deux_col_aux gphe x etiq v n = 
        let v2 = (v+1) mod 2 in 
        etiq.(x) <- v;
        for i=0 to n-1 do if gphe.(x).(i) then (
                if etiq.(i) = -1 then deux_col_aux gphe i etiq v2 n;
                if etiq.(i) = v && i<>x then failwith "pas 2-coloriable"
                );
        done;
;; 

let deux_col gphe = let n = Array.length gphe.(0) in 
        let etiq = Array.make n (-1) in
        for i=0 to n-1 do  
                if etiq.(i) = -1 then deux_col_aux gphe i etiq 0 n;
        done;
        etiq
;;


deux_col graphe;;

let min_couleur_possible gphe etiq s =
        let n = Array.length gphe.(0) in 
        let valeur = Array.make n 0 in 
        for i = 0 to n-1 do 
                if gphe.(s).(i) && etiq.(i)> -1 then 
                        valeur.(etiq.(i)) <- 1
        done;
        let i=ref 0 in while valeur.(!i) = 1 do incr i done;
        !i
;;

min_couleur_possible graphe etiquette 1;;


(* Il est important d'utiliser la longeur de num plutot que gphe dans le cas d'un sous graphe !!!*)
let glouton gphe num = let n = Array.length num in 
        let etiq = Array.make n (-1) in
        for i=0 to n-1 do
                etiq.(num.(i)) <- min_couleur_possible gphe etiq num.(i)
        done;
        etiq
;;

glouton graphe [|1;2;3;0;4|];;

let echange v i j = let temp = v.(i) in 
        v.(i) <- v.(j);
        v.(j) <- temp
;;

let indice_maximum v i j = let resultat = ref i in 
        for k = i+1 to j do 
                if v.(!resultat) < v.(k) then resultat:=k
        done;
        !resultat
;;

let tri_selection v1 v2 = let n = Array.length v1 in 
        for i = 0 to (n-2) do 
                let i2 = indice_maximum v2 i (n-1) in 
                echange v1 i i2;
                echange v2 i i2;
        done
;;

let tri_degre gphe = let n = Array.length gphe.(0) in 
        let degre = Array.make n 0 in 
        for i = 0 to (n-1) do
                let s = ref 0 in
                for j = 0 to (n-1) do 
                        if gphe.(i).(j) && i<>j then incr s
                done;
                degre.(i) <- !s
        done;
        let sommet = Array.make n 0 in 
        for i = 0 to (n-1) do 
                sommet.(i) <- i
        done;
        tri_selection sommet degre;
        sommet
;;

tri_degre graphe;;

let sous_graphe gphe sg = let n = Array.length sg in 
        let gphe2 = Array.make_matrix n n false in
        for i = 0 to (n-1) do
              for j = 0 to (n-1) do 
                    gphe2.(i).(j) <- gphe.(sg.(i)).(sg.(j))
              done
        done;
        gphe2
;; 

sous_graphe graphe [|0;3;1|];;

let voisins_non_colories gphe etiq s = let n = Array.length gphe.(0) and resultat = ref [] in 
        for i = 0 to n-1 do 
                if gphe.(s).(i) && etiq.(i) = -1 then resultat := i::!resultat 
        done;
        !resultat
;;

voisins_non_colories graphe [|1;-1;-1;-1;-1|] 0;;

let degre_non_colories gphe etiq s = List.length (voisins_non_colories gphe etiq s);;

degre_non_colories graphe [|1;-1;-1;-1;-1|] 0;;

let  non_colories gphe etiq = let n = Array.length etiq and resultat = ref [] in 
        for i = 0 to n-1 do
                if etiq.(i) = -1 then resultat := i::!resultat
        done;
        !resultat
;;

non_colories graphe [|1;-1;-1;-1;-1|];;


let array_of_list l = let n = List.length l in if n=0 then [||] else let v = Array.make n (List.hd l) and l2 = ref (List.tl l) in 
        for i = 1 to n-1 do
                v.(i) <- List.hd !l2;
                l2 := List.tl !l2
        done;
        v
;;


let actualise etiq etiq_non_col non_col c = 
        let nb_couleur = ref 1 and
        m = Array.length non_col in
        for i = 0 to m-1 do
                if etiq_non_col.(i) > 0 then nb_couleur := 2; 
                etiq.(non_col.(i)) <- etiq_non_col.(i) + !c
        done;
        !nb_couleur
;;


let wigderson gphe = 

        let c = ref 0 and 
        n = Array.length gphe in
        let racine = int_of_float ( sqrt (float_of_int n)) and 
        etiq = Array.make n (-1) in 
        
        for i = 0 to n-1 do
                if etiq.(i) = -1 && degre_non_colories gphe etiq i >= racine then (
                        let non_col = array_of_list ( voisins_non_colories gphe etiq i ) in
                        let etiq_non_col = deux_col (sous_graphe gphe non_col) in
                        let nb_couleur = actualise etiq etiq_non_col non_col c in
                        if nb_couleur = 2 then incr c;
                        incr c
                );
        done;


        
        let non_col = array_of_list ( non_colories gphe etiq ) in 
        let m = Array.length non_col in 
        let num = Array.make m 0 in 
        for i = 1 to m-1 do 
                num.(i) <- i
        done;
        let etiq_non_col = glouton (sous_graphe gphe non_col) num in   
        let _ = actualise etiq etiq_non_col non_col c in
        
        etiq
;;


wigderson graphe;;
