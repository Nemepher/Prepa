(* Option-MPSI --- TP4 --- Augustin Abert *)

(* 1 *)
let abs x = match x with 
        | a when a>0 -> x
        | _ -> -x;;

let abs x = if x > 0 then x else -x;;

(* 2 *)
let table_mod n =
        for j=0 to (n-1) do 
                for i=0 to (n-1) do 
                        print_int j;
                        print_string " x ";
                        print_int i;
                        print_string " = ";
                        print_int (j*i mod 17);
                        print_string "\t";
                done; print_string "\n"; 
        done; print_string "\n";;


(* 3 *)
let rec somme_cube n = match n with 
        | a when a>0 -> a*a*a + somme_cube (a-1)
        | _ -> 0;;

let rec somme_cube n = if n > 0 then n*n*n + somme_cube (n-1) else 0;;

let somme_cube n = 
        let s = ref 0 in 
        for i=1 to n do 
                s := i*i*i + !s 
        done;
        !s;;

(* 4 *)
let fibo n = 
        let rec aux a b n = match n with
                | 0 -> a      
                | _ -> aux b (b+a) (n-1) 
        in aux 0 1 n;;

let fibo n =  
        let rec aux a b n = 
                if n=0 then a 
                else aux a (b+a) (n-1) 
        in aux 0 1 n;;

let fibo n = 
        let a,b = ref 0, ref 1 in 
        for i=0 to n do
                let aux = !b in 
                b := !b + !a;
                a := aux;
        done;
        !a;;

(* 5 *)
let rec puissance x n = match n with 
        | 0 -> 1
        | _ -> x * puissance x (n-1);;

let rec puissance x n = if n = 0 then 1 else x * puissance x (n-1);;

let puissance x n = 
        let t = ref 1 in 
        for i = 0 to n do
                t := !t * x
        done;
        !t;;

(* 6 *) 
let rec puissance x n = let pow x = x*x in match n with 
        | 0 -> 1
        | n when n mod 2 = 0 -> puissance (pow x) (n/2)
        | _ -> x * puissance x (n-1);;


let rec puissance x n = let pow x = x*x in
        if n = 0 then 1 
        else if n mod 2 = 0 then puissance (pow x) (n/2) 
        else x * puissance x (n-1);;

let puissance x n =  
        let m,t,y = ref n,ref 1,ref x in 
        while !m<>0 do 
                if !m mod 2 = 0 then (y := !y * !y; m := !m / 2)
                else (t := !t * !y; m := !m-1)
        done;
        !t;;

(* 7 *) 

let bezout a b = 
        let rec aux r u v r' u' v' = match r' with 
                | 0 -> r,u,v
                | _ -> let q = r/r' in aux r' u' v' (r-q*r') (u-q*u') (v-q*v')
        in aux a 1 0 b 0 1;;

let bezout a b =
        let rec aux r u v r' u' v' = 
                if r'=0 then r,u,v 
                else let q = r/r' in aux r' u' v' (r-q*r') (u-q*u') (v-q*v')
        in aux a 1 0 b 0 1;; 

let bezout a b = 
        let r,u,v,r',u',v' = ref a, ref 1, ref 0, ref b, ref 0, ref 1 in 
        while !r'<>0 do
        let q, r2,u2,v2 = !r / !r',  !r',!u',!v' in 
                r':=!r-q * r2; u':=!u-q * u2; v':=!v-q * v2; 
                r:= r2; u:= u2; v:= v2;
        done;
        !r,!u,!v;;

(* 8 *)

let syra n = 
        let frec x = match x with 
                | n when n mod 2= 0 -> n/2
                | _ -> 3*x+1 
         in let rec aux n = match n with 
                |1 -> print_string "1 "
                | _ -> print_int n; print_string " "; aux (frec n)
         in aux n;;

let syra n = 
        let frec x  = if x mod 2 = 0 then x/2 else 3*x+1 in 
        let rec aux n = if n=1 then print_string "1 "
                else (print_int n; print_string " "; aux (frec n))
        in aux n;;

let syra n = 
        let frec x = if x mod 2 = 0 then x/2 else 3*x+1 in
        let m = ref n in
        while !m<>1 do
                print_int !m;
                print_string " ";
                m := frec !m; 
        done;
        print_string "1 ";;

(* 9 *)

let newton1 n = 
        let aux x = x/.2. +. 1./.x in 
        let u = ref 2. in
        for i=0 to n do 
                u := aux !u
        done;
        !u;;

let newton2 eps = 
        let aux x = x/.2. +. 1./.x in 
        let u,e,c = ref 3., ref 2.,ref 0 in 
        while !e>eps do 
                let u2 = !u in
                u:= aux u2;
                e:= (u2 -. !u);
                c:=!c+1;
        done;
        print_int !c; print_string " itérations "; !u;;
                        
(* 10 *)

let premier n =
        let i = ref 2 in 
        while !i* !i <= n && (n mod !i <> 0) do i:= !i+1 done;
        if !i* !i > n then true else false;;

(* version récursive *)
let premier n = 
        let rec aux n m = match m with 
                | m when m*m > n -> true 
                | _ -> (n mod m <> 0) && aux n (m+1)
        in aux n 2;;

(* 11 *)

(* version sans puissance *)
let factor1 n = 
        let rec aux n = 
                let i = ref (n-1) in while !i > 1 && (n mod !i <> 0) do i:=!i-1 done;
                if !i = 1 then (print_int n;print_string " ")
                else  (aux !i; aux (n/ !i))
        in aux n;;

(* version avec puissance mais liste *)
let factor2 n = 
        let rec aux n = (* renvoie la liste des facteurs dans l'ordre croissant *)
                let i = ref (n-1) in while !i > 1 && (n mod !i <> 0) do i:=!i-1 done;
                match !i with
                        | 1 -> n::[]
                        | _ -> aux (!i) @ aux (n/ !i)
        in let rec aux2 l f c = match l with (* compte et affiche sans répétition les facteurs *)
                | [] -> print_int f; print_string "^"; print_int c; print_string " "
                | a::b when a=f -> aux2 b f (c+1)
                | a::b -> print_int f; print_string "^"; print_int c; print_string " "; aux2 b a 1
        in let l = aux n in aux2 l (List.hd l) 0;;








(*factor2 (liste_facteur 6454191);;*)





