type 'a arbre_binaire = Vide 
                      | Noeud of 'a * 'a arbre_binaire * 'a arbre_binaire
;;

let rec hauteur t = match t with 
        Vide             -> 0
      | Noeud (_, g, d ) -> 1 + max (hauteur g) (hauteur d) 
;;

let diff a b = let c = a-b in if c>=0 then c else -c;;

let rec equilibre_naif t = match t with 
        Vide             -> true
      | Noeud (_, g, d ) -> diff (hauteur g) (hauteur d) <= 1 && equilibre_naif g && equilibre_naif d
;;

let rec hauteur2 t = match t with 
        Vide                   -> failwith "arbre vide"
      | Noeud (a, Vide, Vide ) -> 1
      | Noeud (a, g, Vide )    -> if hauteur2 g >1 then failwith "pas equilibre"  else 2
      | Noeud (a, Vide, d )    -> if hauteur2 d >1 then failwith "pas equilibre"  else 2
      | Noeud (a, g, d )       -> let eg, ed = hauteur2 g, hauteur2 d in if diff eg ed >1 then failwith "pas equilibre" else 1 + max eg ed
;;

let equilibre t = try let _ = hauteur2 t in true with
        Failure "arbre vide"    -> true
      | Failure "pas equilibre" -> false 
;;


