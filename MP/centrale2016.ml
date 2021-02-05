type arbre = 
        | Vide 
        | Noeud of int*arbre*arbre
;;

let rec insere x u = match u with 
        [] -> [x]
        | a::suite when x>a -> a::x::suite
        | a::suite -> a::insere x suite
;;

let rec tri_insertion u = match u with 
        [] -> u
        | a::suite -> insere a (tri_insertion suite)
;;

let min_tas a = match a with
        Vide -> failwith "vide"
        | Noeud (n,_,_) -> n
;;

let min_quasi a = match a with 
        Vide                                  -> failwith "vide"
        | Noeud (n,Vide,_) | Noeud (n,_,Vide) -> n
        | Noeud (n,a,b)                       -> min n (min (min_tas a) (min_tas b))
;;

let rec percole a = let m = min_quasi a in match a with 
        Vide                               -> a 
        | Noeud (n,_,_) when n = m         -> a 
        | Noeud (n,b,c) when min_tas b = m -> let Noeud (_,b1,b2) = b in  Noeud ( m, percole (Noeud (n,b1,b2)), c ) 
        | Noeud (n,b,c)                    -> let Noeud (_,c1,c2) = c in  Noeud ( m, b, percole (Noeud (n,c1,c2)) ) 
;;

let rec decomp_parf n = let decomp = decomp_parf (n-1) in match decomp with
        k1::k2::suite when k1 = k2 -> (k1+1)::suite   
        | _                        -> 1::decomp
;;

let rec ajoute x h = match h with 
        (a1,t1)::(a2,t2)::suite when t1 = t2 -> (percole (Noeud (x,a1,a2)), t1+t2+1) :: suite 
        | _ -> (Noeud (x,Vide,Vide), 1)::h
;;

let rec constr_liste_tas l = match l with
        | [] -> []
        | x :: r -> ajoute  x (constr_liste_tas r)
;;

let echange_racine a1 a2 = let Noeud (x1,a11,a12) = a1 and Noeud (x2,a21,a22) = a2 in ( Noeud(x2,a11,a12), Noeud(x1,a21,a22));;


