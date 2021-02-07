type arbre = 
        | Vide 
        | Noeud of int*arbre*arbre
;;

type tasbin = {donnees : int array ; pos : int ; taille : int} ;;

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

let insere_quasi a t h = match h with 
        []               -> [(percole a,t)]
        | (a1,t1)::suite -> let m1 = min_tas a and m2 = min_tas (fst (List.hd h)) in
                                    if m1 <= m2 then (percole a,t)::h
                                    else let (b,b1) = echange_racine a a1 in (b,t)::(b1,t1)::suite 
;;

let rec tri_racines h = match h with 
        []             -> []
        | (a,t)::suite -> insere_quasi a t (tri_racines suite)
;;

let rec extraire h = match h with 
        [] | (Vide,_)::_                  -> []
        | ( Noeud (x,Vide,_),_ ) ::suite -> x :: extraire suite
        | ( Noeud (x,a1,a2), t ) ::suite -> let t1 = (t+1)/2-1 in x :: extraire (insere_quasi a1 t1 (insere_quasi a2 t1 suite)) 
;;

let tri_lisse l = extraire (tri_racines (constr_liste_tas l)) ;;

let liste = [4;4;2;7;3;8];;
tri_lisse liste;;

let fg a = if a.taille = 0 then a else {donnees = a.donnees; pos = a.pos+1; taille = (a.taille+1)/2-1};;

let fd a = if a.taille = 0 then a else let k =(a.taille+1)/2-1 in {donnees = a.donnees; pos = a.pos+1+k; taille = k};;

let min_tas_vect a = a.donnees.(a.pos);;

let min_quasi_vect a = min a.donnees.(a.pos) (min a.donnees.(a.pos+1) a.donnees.(a.pos+1+(a.taille+1)/2-1));;

let echange t a b = let temp = t.(a) in t.(a) <- t.(b); t.(b) <- temp;;

let rec percole_vect a = if a.taille <> 0 then let m = min_quasi_vect a in 
        if a.donnees.(a.pos+1) = m then echange a.donnees a.pos (a.pos+1); percole_vect (fg a) 
        else echange a.donnees a.pos (a.pos+1+(a.taille+1)/2-1); percole_vect (fd a)
;;

(*let ajoute_vect d p h =

let rec constr_liste_tas_aux d p h =
        if p = 0 then h 
        else 
                let h' = ajoute_vect d (p-1) h in 
                constr_liste_tas_aux d (p-1) h
;;

let constr_liste_tas_vect d = constr_liste_tas d (vect_length d) [];;
*)
