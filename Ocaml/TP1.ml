let f x = 2. *. exp x;;

print_int 9;;
print_string "bonjour";;
Printf.printf "Au concours info, j'ai %f/%d" 19.5 20;;

let t= 1,2;;
fst t;;
snd t;;

let f x = log x +. sin x ;;
f 3.;; (*ne marche pas bien sur ! f 3;;*)

let f x = x**2. ;;
f 3. *. 2. ;;
f (3. *. 2.) ;;

let tanh x = let e=exp(x) in (e -. 1./.e)/.(e +. 1./.e) ;;

type complexe = { x: float ; mutable y: float};;
let conj z = z. y <- -.z. y;;
let z = {x=3. ; y = 5.};;
conj z;;
z;;

let g f x = f (x+1) ;;
let f x = 3*x ;;
g f 2;;

let composition f g x = f (g x);;
let u x = x+1;;
let v x = x*x;;
composition v;;
let h = composition v u;;
h 3;;

let derivee f x = (f (x +. 0.001) -. f x)/. 0.001 ;;
derivee tanh 984.;;

let max3 x y z = max max x y z;; (* (a' -> a' -> a') -> a' -> a' -> a' *)
let max3 x y z = max x ( max y z );; 
max3 1 2 3;;
