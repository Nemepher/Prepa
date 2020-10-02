type 'a arbre_binaire = Vide 
              | Noeud of 'a * 'a arbre_binaire * 'a arbre_binaire
              
;;

let rec insere x t = match t with 
        Vide                     -> Noeud (x, Vide, Vide)
      | Noeud(e, g, d) when x>e  -> Noeud (e, g, insere x d)
      | Noeud(e, g, d)           -> Noeud (e, insere x d, g)
;;

let rec cree_abr l = match l with 
        []       -> Vide
      | e::suite -> insere e (cree_abr suite)
;;

let rec liste_aleatoire n p = match n with
        0 -> []
      | _ -> Random.int p :: liste_aleatoire (n-1) p
;;

let abr_aleatoire n p = cree_abr (liste_aleatoire n p);;

let rec minmax t = match t with
        Vide                    -> failwith "pas abr"
      | Noeud ( a, Vide, Vide ) -> (a,a)
      | Noeud ( a, Vide, d )    -> let (maxd,mind) = minmax d in if a>mind then failwith "pas abr" else (maxd,a)
      | Noeud ( a, g, Vide )    -> let (maxg,ming) = minmax g in if a<maxg then failwith "pas abr" else (a,ming)
      | Noeud ( a, g, d )       -> let (maxd,mind) = minmax d and (maxg,ming) = minmax g in if a>mind || a<maxg then failwith "pas abr" else (maxd,ming)  

let test_abr1 t = try let _ = minmax t in true with 
        Failure "arbre_binaire vide" -> true
      | Failure "pas abr"    -> false 
;;

let rec liste_triee l = match l with
        [] | [_]    -> true
      | a::b::suite -> a<=b && liste_triee (b::suite)
;;

let rec liste_infixe_naif t = match t with
        Vide                   -> []
      | Noeud (a, Vide, Vide ) -> [a]
      | Noeud (a, Vide, d )    -> a :: liste_infixe_naif d
      | Noeud (a, g, Vide )    -> liste_infixe_naif g @ [a]
      | Noeud (a, g, d)        -> let lg, ld = liste_infixe_naif g, liste_infixe_naif d in lg @ a::ld         
;;

let test_abr2 t = liste_triee (liste_infixe_naif t);;

let t = abr_aleatoire 4 5;;
liste_infixe_naif t;;
test_abr1 t;;
test_abr2 t;;



