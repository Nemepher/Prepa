let f x = match x with
        | 0. -> 1.234
        | _ -> sqrt x +. 1. ;;

let g n = match n with
        | 0 -> 0
        | n -> 1 / n ;;


let rec somme_cubes n = match n with 
        | 0 -> 0 
        | n -> n*n*n + somme_cubes (n-1) ;;

let rec sigma f m n = match n with 
        | n when n<m -> 0 
        | n when n=m -> f m 
        | n -> f(n) + sigma f m (n-1) ;;

let f n = 1;;
sigma f 5 8;;

let somme f n = sigma f 0 n ;;

let somme_cubes n = let f n = n*n*n in sigma f 0 n ;;
somme_cubes 2;;

let rec puissance x n = match n with 
        | 0 -> 1
        | n -> x * puissance x (n-1) ;;
puissance 2 3;;

let rec puissance_rapide x n = match n with 
        | 0 -> 1
        | n when n mod 2 = 0 -> let h n = n*n in h (puissance_rapide x (n / 2) )
        | n -> x * puissance_rapide x (n-1) ;;
puissance_rapide 3 4;;


let compose g f x = g (f x) ;;

let rec composen n f x = match n with 
        | 0 -> x
        | n -> composen (n-1) f (f x) ;;
let f n = 2*n;;
composen 3 f 3;;


let A a b = 2*a + b*b;;
let B a b = -a*a*a + b;;
let rec suites n a b = match n with
        | 0 -> a,b 
        | n -> suites (n-1) (A a b) (B a b) ;;   
        

let rec fibo n = match n with 
        | 0 -> 0
        | 1 -> 1
        | n -> fibo (n-1) + fibo (n-2) ;;

let fibo n = 
        let rec aux a b n = match n with 
                | 0 -> a
                | _ -> aux (a+b) a (n-1)
        in aux 0 1 n;;

let bino n p = match p with 
        | p when p>n -> 0
        | _ -> let rec aux n p = match p with 
                        |0 -> 1
                        | _ -> (n * aux (n-1) (p-1)) / p 
                in aux n (min p n) ;;
bino 3 4;;
bino 3 1;;

let rec euclide a b = match b with
        | 0 -> a
        | b -> euclide b (a mod b );;

let bezout a b = 
        let rec aux a b u v w x = match b with 
                | 0 -> a,u,w
                | b -> let q = a/b in aux b (a-q*b) v (u-q*v) x (w-q*x)
        in aux a b 1 0 0 1;;
bezout 2 5 ;;


let rec syra a = 
        let next n = match n with 
                | n when n mod 2 = 0  -> n/2
                | _ -> 3*n +1
        in print_int a; print_string " "; match a with 
                | 1 -> 0       
                | _ -> 1+syra (next a);;
syra 3;;

let rec catalan n = 
        let f k = (catalan k) * (catalan (n-1-k)) in
        match n with
                | 0 -> 1        
                | _ -> somme f (n-1);;

let rec aff f n = print_int (f n);print_string " ";match n with
        | 0 -> ()
        | _ -> aff f (n-1);;

aff catalan 10;;

        
let rec premier n = 
        














