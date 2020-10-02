type 'a arbre_binaire = Vide 
                      | Noeud of 'a * 'a arbre_binaire * a' arbre_binaire
;;

let rec hauteur t = match t with 
        Vide             -> 0
      | Noeud (_, g, d ) -> 1 + max (hauteur g) (hauteur d) 
;;

let norme a b = let c = a-b in if c>=0 then c else -c;;

let rec equilibre_naif t = match t with 
        Vide             -> true
      | Noeud (_, g, d ) -> norme (hauteur g) (hauteur d) <= 1 && equilibre_naif g && equilibre_naif d
;;
