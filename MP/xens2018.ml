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
(*
graphe.(0).(1) <-true;;
graphe.(1).(0) <-true;;
*)
graphe;;

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
        while !i<>n && !col do print_int x; print_int !i; if gphe.(x).(!i) then (
                
                print_string "in ";
                if etiq.(!i) = -1 then col:= deux_col_aux gphe !i etiq v2 n;
                if etiq.(!i) = v && !i<>x then col := false

        );
        print_string " ";
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

let glouton gphe num = let n = Array.length num in 
        let etiq = Array.make n (-1) in
        for i =0 to n-1 do
                etiq.(num.(i)) <- min_couleur_possible gphe etiq num.(i)
        done;
        etiq
;;

glouton graphe [|1;2;3;0;4|];;
