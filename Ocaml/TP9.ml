(* Option-MPSI --- TP9 --- Augustin Abert *)

(* 1 *)
let echange i j t = 
        let tmp = t.(i) in 
                t.(i) <- t.(j);
                t.(j) <- tmp ;;

(* 2 *)
let rec liste_aleatoire n a =
        match n with 
        | 0 -> []
        | _ -> Random.int a::liste_aleatoire (n-1) a ;;

let tableau_aleatoire n a =
        let v = Array.make n 0 in
        for i = 0 to (n-1) do 
                v.(i) <- Random.int a
        done;v;;

(* 3 -- List.sort est de type ('a -> 'a -> int) -> 'a list -> 'a list. Il faut lui fournir en argument une fonction de comparaison puis la liste en question *)

(* 4 *) 

(* Fonctions utiles pour la suite *)
let temps s f x = 
        let t = Sys.time() in
        let fx = f x in
        print_string "Temps d'execution de "; print_string s; print_float (Sys.time() -. t); print_string "s\n";;

let array_of_list l = 
        let a = Array.make (List.length l) 0 in
        let rec aux l n = match l with 
                | h::t -> a.(n) <- h;aux t (n+1)
                | [] -> a
        in aux l 0;;

(* Fonctions de tri vus en cours *)
let tri_selection_tableau v =
        let n = Array.length v in 
        let debut = ref 0 in
        while (!debut < n-1) do 
                let mini = ref !debut in 
                for i = !debut+1 to n-1 do
                        if v.(!mini) > v.(i) then mini:=i 
                done;
                echange !mini !debut v;
                debut:=!debut+1
        done;; 

let rec minimum_et_reste r = match r with 
                | [x]  -> (x,[]) 
                | t::q -> let (m2,l2) = minimum_et_reste q in
                        if t < m2 then (t,q) else (m2,t::l2)  
                | _ -> failwith "liste vide" 

let rec tri_selection l = match l with 
                | [] -> []
                | l -> let (m,r) = minimum_et_reste l in m::(tri_selection r);;

let insere_element_tableau v i =
        let j = ref i and e = v.(i) in
        while (!j>0) && (e < v.(!j-1)) do
                v.(!j) <- v.(!j-1); j:= !j-1
        done;
        v.(!j) <- e;;

let tri_insertion_tableau v =
        for i=0 to (Array.length v)-1 do 
                insere_element_tableau v i
        done;;

let rec insere e l = match l with 
        | []   -> [e]
        | t::q -> if e<t then t::(insere e q) else e::t::q ;;

let rec tri_insertion l = match l with 
        | [] -> []
        | t::q -> insere t (tri_insertion q) ;;

let fusion_tableau v debut fin aux =
        let m = (debut+fin)/2 and i = ref debut in let j = ref (m+1) in 
        for k = 0 to (fin-debut) do 
                if (!i<=m) then (
                        if (!j<=fin) then (
                                if (v.(!i) < v.(!j)) then begin aux.(k) <- v.(!i); i := !i+1 end
                                else begin aux.(k) <- v.(!j); j := !j+1 end
                        ) else (
                                aux.(k) <- v.(!i); i := !i+1 
                        )
                ) else (
                        aux.(k) <- v.(!j); j := !j+1
                )
        done;
        for k = 0 to (fin-debut) do
             v.(debut+k) <- aux.(k)   
        done;;

let tri_fusion_tableau v = 
        let n = Array.length v in 
        let aux = Array.make n 0 in
        let rec tri v i j aux =
                if j>i then (
                        let m = (j+i)/2 in 
                        tri v i m aux;
                        tri v (m+1) j aux;
                        fusion_tableau v i j aux
                )
        in tri v 0 (n-1) aux ;;

let rec divise l = match l with 
        | [] | [_] -> (l,[])
        | a::b::r -> let (m1,m2) = divise r in (a::m1,b::m2) ;; 

let rec fusion l1 l2 = match l1,l2 with 
        | l,[] | [],l -> l
        | (t1::q1 as l1),(t2::q2 as l2) -> if t1<t2 then t1::(fusion q1 l2) 
                                                    else t2::(fusion l1 q2) ;;

let rec tri_fusion l = match l with
        | [] | [_] -> l
        | l   -> let (m1,m2) = divise l in fusion (tri_fusion m1) (tri_fusion m2);;

(* Tests comparatifs *)
for i=0 to 2 do (
        print_string "\nTest "; print_int i; print_string "/2\n";
        let l = liste_aleatoire 20 25 in
        let t = array_of_list l in
        temps "tri selection tableau :" tri_selection_tableau t;
        temps "tri selection liste :" tri_selection l;
        temps "tri insertion tableau :" tri_insertion_tableau t;
        temps "tri insertion liste :" tri_insertion l;
        temps "tri fusion tableau :" tri_fusion_tableau t;
        temps "tri fusion liste :" tri_fusion l;
) done;;


(* 5 *)
let une_passe_tableau fin v =
        for i=0 to fin-1 do 
                if v.(i+1) < v.(i) then echange i (i+1) v 
        done;;

(* 6 *)
let tri_bulle_tableau v =
        let n = Array.length v in
        for i=1 to n-1 do
                une_passe_tableau (n-i) v
        done;;

(* 7 *)
let une_passe_tableau fin v =
        let b = ref false in
        for i=0 to fin-1 do 
                if v.(i+1) < v.(i) then (b:=true; echange i (i+1) v) 
        done;!b;;

let tri_bulle_tableau v =
        let n = Array.length v in
        let i=ref 1 in 
        while !i<n && (une_passe_tableau (n- !i) v) do
                i:= !i+1
        done;;

(* 8 *)
let une_passe l = 
        let rec aux l b = match l with 
                | [] | [_] -> (l,b)
                | t::q -> let (l2,b2) = aux q b in let t2 = List.hd l2 in 
                if t>=t2 then (t::l2, b)
                else begin (t2::t::(List.tl l2), true) end; 
        in (aux l false);;

let rec tri_bulle l = let (l2,b) = une_passe l in match l2,b with
        | _,false | [],_ | [_],_ -> l2
        | t::q, true -> t::(tri_bulle q);;

(* 9 -- TODO *)

(* 10 *)
let une_passe2 l n = 
        let rec aux l b n = match l with 
                | [] | [_] -> (l,b,n)
                | t::q -> let (l2,b2,n2) = aux q b n in let t2 = List.hd l2 in 
                if t>=t2 then (t::l2, b, (n2+1))
                else (t2::t::(List.tl l2), true, (n2+1) ); 
        in (aux l false n);;

let tri_bulle2 l =  
        let rec aux l n = let (l2,b,n2) = une_passe2 l n in match l2,b with 
                | _,false | [],_ | [_],_ -> (l2,n2)
                | t::q, _ -> let (q2,n3) = aux q n2 in (t::q2,n3);
        in aux l 0;;

(* 11 -- TODO *)

(* 12 -- TODO *)

(* 13 *)
let echange3 i j v =
        let tmp = v.(i) in
        v.(i)   <- v.(j-1);
        v.(j-1) <- v.(j);
        v.(j)   <- tmp;;

let tri_rapide_tableau v = 
        let rec aux debut fin = if fin-debut>0 then begin
                let g,d = ref debut, ref fin in 
                while !g < !d do
                        if v.(!g) >= v.(!d) then (echange3 !g !d v; d:=!d-1 ) else g:=!g+1 
                done; 
                aux debut (!d-1); aux (!d+1) fin end
        in aux 0 (Array.length v - 1);;

(* Version alternative *)
let tri_rapide_tableau2 v = 
        let rec aux debut fin = if fin-debut>0 then begin
                let g = ref (debut-1) in 
                for d=debut to fin-1 do 
                        if v.(d) < v.(fin) then (g:= !g+1; echange !g d v;) 
                done;
                 echange fin (!g+1) v;
                aux debut (!g); aux (!g+2) fin end
        in aux 0 (Array.length v - 1);;

(* 14 *)

(* version abominable *)
let rec divise l a d g = match l with 
        |[] -> (d,g)
        |t::q -> if t<=a then divise q a (t::d) g else divise q a d (t::g);;
let rec tri_pas_si_rapide l = match l with 
       | [] | [_] -> l
       | a::q -> let (l1,l2) = divise q a [] [] in (tri_pas_si_rapide l1) @ (a::(tri_pas_si_rapide l2));;

(* meilleure version *)
let tri_rapide l =
        
        let rec divise p l g d = match l with 
        |[] -> (d,g)
        |t::q -> if t>=p then divise p q g (t::d) else divise p q (t::g) d;

        in let rec aux l accu = match l with 
                | [] -> accu
                | [t] -> t::accu
                | t::q -> let (g,d) = divise t q [] [] in let accu2 = t::(aux g accu) in aux d accu2;

        in aux l [];;    

(* 15 -- TODO *)

(* 16 -- TODO *)

(* 17 *)
let tri_rapide_tableau2 v = 
        let rec aux debut fin = if fin-debut>0 then begin
                echange fin (Random.int (fin+1)) v; 
                let g,d = ref debut, ref fin in 
                while !g < !d do
                        if v.(!g) >= v.(!d) then (echange3 !g !d v; d:=!d-1 ) else g:=!g+1 
                done; 
                aux debut (!d-1); aux (!d+1) fin end
        in aux 0 (Array.length v - 1);;

(* 18 -- TODO *)

