#load "graphics.cma";;
#load "unix.cma";;

Graphics.open_graph "" ;; 
let pause () = let _ = Unix.select [] [] [] 0.25 in ();; 

let dessine_case (i,j) pas couleur = 
        Graphics.set_color couleur;
        Graphics.fill_rect i j pas pas
;;

let dessine_labyrinthe a pas = 
        let n,p = Array.length a, Array.length a.(0) in
        for i = 0 to n-1 do
                for j =0 to p-1 do 
                        let dessine = dessine_case (i*pas,j*pas) pas in 
                                if a.(i).(j) then dessine Graphics.white
                                else dessine Graphics.blue
                done
        done
;;

let rec mur_horizontal a n_min n_max p_min p_max = 
        let n = match (n_max-n_min)//2 with 
                0 ->  
                a when a%2 = 0 -> 
                _ -> 
and mur_vertical a n_min n_max p_min p_max =

let cree_labyrinthe n p = let a = Array.make_matrix n p true in mur_horizontal a 0 (n-1) 0 (p-1);;


let a = Array.make_matrix 25 18 false;;
a.(5).(5) <- true;;

dessine_labyrinthe a 49;;
Unix.sleep 1;;


