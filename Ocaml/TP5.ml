(* Option-MPSI --- TP5 --- Augustin Abert *)

let a = [|1;2;3;-10|];;
let b = [|0;0;0;1;1;1;2|];;

(* 1 *)
let echange t i j = 
        let temp = t.(i) in 
        t.(i) <- t.(j);
        t.(j) <- temp;;

(* 2 *)
let sub t d l =   
        let a = Array.make l 0 in
        for i=0 to (l-1) do
                a.(i) <- t.(i+d)
        done;
        a;;

(* 3 *)
let copy t = let l = Array.length t in
        let a = Array.make l 0 in
        for i=0 to (l-1) do
                a.(i) <- t.(i)
        done;
        a;;

(* 4 *)
let append_array t1 t2 =
        let l1,l2 = Array.length t1, Array.length t2 in
        let a = Array.make (l1+l2) 0 in
        for i=0 to (l1-1) do a.(i) <- t1.(i) done;
        for i=0 to (l2-1) do a.(i+l1) <- t2.(i) done;
        a;;


(* 5 *)
let init n f = 
        let a = Array.make n 0 in
        for i = 0 to (n-1) do
                a.(i) <- f i
        done;
        a;;

(* 6 *)
let rev_tableau t =
        let l = Array.length t in
        let a = Array.make l 0 in
        for i=0 to (l-1) do
               a.(i) <- t.(l-1-i)
        done;
        a;;

(* 7 *)
let array_of_list l = 
        let a = Array.make (List.length l) 0 in
        let rec aux l n = match l with 
                | h::t -> a.(n) <- h;aux t (n+1)
                | [] -> a
        in aux l 0;;

let array_to_list a =
        let rec aux l n = match n with
                | -1 -> l
                | _ -> aux (a.(n)::l) (n-1)
        in aux [] (Array.length a -1);;

(* 8 -- Pour accéder à l'élement ligne i colonne j d'une matrice m on dispose de m.(i).(j) *)

(* 9 -- Cette commande prend en argument dans cet ordre: le nombre de ligne, de colone, et la valeur assignée à chaque élément. *)

(* 10 *)
let m = Array.make_matrix 3 5 0;;
for i=0 to 2 do
        for j=0 to 4 do
                m.(i).(j) <- 1 + abs (j-i)
        done;
done;;
m;;

(* 11 *)
let transpose m = 
        let l1, l2 = Array.length m,Array.length m.(0) in 
        let a = Array.make_matrix l2 l1 0 in
        for i=0 to (l2-1) do
                for j=0 to (l1-1) do
                        a.(i).(j) <- m.(j).(i);
                done;               
        done;a;;

(* 12 Comme indiqué, cette solution ne permet pas d'utiliser les matrices crées de la même manière que celles produites par Array.make_matrix car toutes les lignes, si elles ne sont pas remplacées entierement, partage une même adresse de la mémoire. *)

(* 13 *)
let make_matrix n p x = 
        let m = Array.make n [||] in
        for i = 0 to (n-1) do
                m.(i) <- Array.make p x
        done;m;;

(* 14 Les lignes de m et m2 pointent toujours vers les même adresses de la mémoire *)
let m = make_matrix 2 2 1;;
let m2 = Array.copy m;;
m2.(0) <- [|3;3;|];;
m2.(1).(1) <- 2;;
m;;

let copy_matrix m = 
        let lm = Array.length m in 
        let a = Array.make lm [||] in 
        for i=0 to (lm -1) do
                a.(i) <- Array.copy m.(i)
        done;a;;

let m = make_matrix 2 2 1;;
let m2 = copy_matrix m;;
m2.(1).(1) <- 2;;
m;;

(* 15 *)
let nboccurence_tableau x v =
        let c = ref 0 in
        for i=0 to (Array.length v -1) do
                if v.(i) = x then c := 1+ !c
        done;!c;;

(* 16 *)
let min_tableau v = 
        let m = ref v.(0) in
        for i=0 to (Array.length v -1) do
                if v.(i) < !m then m := v.(i)
        done;!m;;

(* 17 *)
let indice_min_tableau v = 
        let m, p = ref v.(0), ref 0 in
        for i=0 to (Array.length v -1) do
                if v.(i) < !m then (m := v.(i); p:= i)
        done;!p;;

(* 18 *)
(* Version récursive *)
let est_croissant t = 
        let rec aux x = if x = 0 then true else ((t.(x-1)<=t.(x)) && (aux (x-1))) in
        aux (Array.length t -1);;

(* Version ittérative *)
let est_croissant t=
        let c = ref (Array.length t -1) in 
        while (!c>0 && t.(!c -1)<=t.(!c)) do
                c:=!c-1
        done;!c=0;; 

(* 19 *)
let appartient x v =
        let c = ref (Array.length v -1) in 
        while (!c>0 && v.(!c) != x) do
                c:=!c-1
        done;(!c != 0 || v.(0)=x);; 
 
(* 20 *)
let dicho x v =
        let rec aux r l = 
                if r = l then (v.(r)=x)
                else let m = (r+l)/2 in
                if v.(m) < x then aux (m+1) l else aux r m 
        in aux 0 (Array.length v -1);;

(* 21 *)
let dicho x v =
        let rec aux r l = 
                if r = l then (if v.(r)=x then r else failwith "Non present")
                else let m = (r+l)/2 in
                if v.(m) < x then aux (m+1) l else aux r m 
        in aux 0 (Array.length v -1);;

(* 22 *)
let era n = 
        let a = Array.make (n-1) 1 in 

        let pow x = x*x in

        let suppr_multiples m t =  
                for i = 1 to (n/m) do
                        t.((i*m)-2) <- 0
                done    
        
       in let dernier_indice m t =
                let i = ref (n-2) in
                while !i>0 && t.(!i) != m do 
                        i := !i -1
                done; if (!i>0 || t.(0)=1) then !i else failwith "Non present"
       
        in let premier_indice m t =
                let i = ref 0 in
                while !i<(n-2) && t.(!i) != m do 
                        i := !i +1
                done; if (!i<(n-2) || t.(n-2)=1) then !i else failwith "Non present"

        in let rec aux l = 
                let m = (premier_indice 1 a) + 2 in 
                if pow m <= (dernier_indice 1 a + 2) then (suppr_multiples m a; aux (m::l)) else l
       
        in let rec aux2 i l = if i=(n-1) then l else ( if a.(i)=1 then aux2 (1+i) ((i+2)::l) else aux2 (i+1) l) 
        
        in aux2 0 (aux []);;

(* 23 *)
let multi_poly_naif a b =
        let la, lb = Array.length a , Array.length b in 
        let c = Array.make (la+lb-1) 0 in
        for i = 0 to (la+lb-2) do
                for j = (max (i-lb+1) 0) to (min (la-1) i) do
                    c.(i) <- c.(i) + a.(j)*b.(i-j)    
                done;
        done;c;;

(* 24 *)
let multi_poly_karatsuba a b =

        let separe p t = 
                let a,b = Array.make p 0, Array.make p 0 in
                for i=0 to (p-1) do
                        a.(i) <- t.(i);
                        b.(i) <- t.(i+p)
                done;(a,b)
        
        in let rec aux a b = 
                let la = Array.length a in
                if la = 1 then [|a.(0)*b.(0)|] else (

                let p = la/2 in
                let c = Array.make (la*2-1) 0 in
                
                let (a1, a0), (b1, b0) = separe p a, separe p b in 
                let aa, bb = Array.make p 0, Array.make p 0 in 
                for i=0 to (p-1) do 
                        aa.(i) <- a0.(i)+a1.(i);
                        bb.(i) <- b0.(i)+b1.(i);
                done;


                let c0,c1,c2 = aux a0 b0, aux a1 b1, aux aa bb in
                
                for i = 0 to (2*p-2) do 
                        c.(i) <- c.(i) + c0.(i);
                        c.(i+p) <- c.(i+p)+c2.(i)-c1.(i)-c0.(i);
                        c.(i+2*p) <- c.(i+2*p) + c1.(i)
                done;c) 

        in aux a b;;
