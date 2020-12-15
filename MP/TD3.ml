type arbre = Feuille of char | Noeud of arbre * arbre ;;

let rec associe lettre code = match code with 
        [] -> failwith "lettre non trouvée"
        | (l,m)::suite when l=lettre -> m 
        | _::suite -> associe lettre suite 
;;

let encode texte code = let mot = ref [] and n = String.length texte in
        for i = n-1 downto 0 do 
                mot := associe texte.[i] code @ !mot 
        done;
        !mot
;;


let code = [('a', [ true;true]); ('b', [false;true])];;
encode "aaa" code;;

let rec decoupe texte_code t = match (t, texte_code) with
        Feuille c, _            -> (c, texte_code) 
      | _, []                 -> failwith "decodage impossible" 
      | Noeud (g,d), m::suite -> if m then decoupe suite d else decoupe suite g
;;

let string_of_chars chars = let n = List.length chars and l = ref chars in
        let str = String.create n in
        for i = 0 to n-1 do 
                str.[i] <- List.hd !l;
                l := List.tl !l
        done;
        str 
;;
 
let decode texte_code t = let characteres = ref [] and restant = ref texte_code in
        while !restant <> [] do
                print_string " test ";
                let (c,l) = decoupe !restant t in 
                characteres := c::!characteres;
                restant := l;
        done;
        string_of_chars (List.rev !characteres)
;;

let t = Noeud (Noeud (Noeud (Feuille 'l',
                             Feuille 'r'),
                      Feuille 'm'),
               Noeud (Feuille 'a',
                      Feuille 'e')) 
;;
let l1 = [false;true;true;true;false;false;true];; 
decode l1 t;;

let rec arbre_en_code_aux code chemin t = match t with 
        Noeud (g,d) -> arbre_en_code_aux code (false::chemin) g; arbre_en_code_aux code (true::chemin) d
      | Feuille c   -> code:=(c,chemin)::!code  
;;

let arbre_en_code t = let code = ref [] in arbre_en_code_aux code [] t; !code;;

arbre_en_code t;;


let echange s i j = let temp = s.[i] in s.[i] <- s.[j]; s.[j] <- temp;;

let indice_minimum s i j = let resultat = ref i in
        for k = i to j do 
                if s.[k] < s.[!resultat] then resultat := k
        done;
        !resultat
;;

let tri_selection s = let n = String.length s in 
        for i = 0 to n-2 do 
                echange s i (indice_minimum s i (n-1))
        done
;;

let occurence texte = let n = String.length texte and texte_copie = String.copy texte in  
        tri_selection texte_copie;
        let resultat, occurence, actuel = ref [], ref 1, ref texte_copie.[0] in 
        for i = 1 to n-1 do
                if texte_copie.[i] != !actuel then ( resultat := (!actuel,!occurence)::!resultat; occurence:=1; actuel:=texte_copie.[i] ) 
                else incr occurence
        done;
        (!actuel,!occurence)::!resultat
;;

let o = occurence "La mer c'est rigolo, il y a des algues et des méduses.";;


let rec partition x l = match l with 
        []       -> ( [], [] )
      | (a,b)::suite -> let (u,v) = partition x suite in 
                        if b <= x then ((a,b)::u,v) else (u,(a,b)::v)
;;

let rec quicksort l = match l with 
        [] -> []
      | (a,b)::suite -> let (l1,l2) = partition b suite in quicksort l1 @ ((Feuille a,b)::quicksort l2)
;;     

let initialise_foret l = quicksort l;;

initialise_foret o;;

let rec insere (t,o) foret = match foret with 
        []  -> [(t,o)]
      | (t2,o2)::suite when o>o2 -> (t2,o2)::(insere (t,o) suite)
      | _ -> (t,o)::foret
;;

let reduit_foret foret = match foret with
        [] | [_]                -> foret
      | (t1,o1)::(t2,o2)::suite -> insere (Noeud (t1,t2), o1+o2) suite 
;;

let construit_arbre texte = 
        let foret = ref (initialise_foret (occurence texte)) in 
        for _ = 0 to List.length !foret do 
              foret := reduit_foret !foret 
        done;
        fst (List.hd !foret)
;; 

let t=construit_arbre "merveille";;
let c=arbre_en_code t;;

encode "merveille" c;;
encode "vermeille" c;;
let mc = encode "rire" c;;

decode mc t;;
