(* Option-MPSI --- TP8 --- Augustin Abert *)

(* 1 *)
type reel_etendu = Plus_inf | Moins_inf | Reel of float ;;

let addition x y = match x,y with 
        | Reel a, Reel b -> Reel (a+.b)
        | Plus_inf, Moins_inf | Moins_inf, Plus_inf -> failwith "indefini"
        | Plus_inf, _ | _, Plus_inf -> Plus_inf
        | _ -> Moins_inf ;;

(* 2 *)
type operateur = Plus | Moins | Mult | Divi ;;

(* 3 *)
type expression = 
        | F of float 
        | N of operateur * expression * expression ;;

let expr1 = N (Divi, N (Plus, F 3.2, N (Divi, F 21.4, F 57.2)), N (Moins, F 12.3, N (Mult, F 6.2, F 1.11)));;

(* 4 *)
let rec nombre_noeuds e = match e with 
        | N (_,n1,n2) -> 1 + (nombre_noeuds n1) + (nombre_noeuds n2)
        | _ -> 1 ;;

(* 5 *)
let rec nombre_noeuds_internes e = match e with 
        | N (_,n1,n2) -> 1 + (nombre_noeuds_internes n1) + (nombre_noeuds_internes n2)
        | _ -> 0 ;;

(* 6 *)
let rec nombre_feuilles e = match e with 
        | N (_,n1,n2) -> (nombre_feuilles n1) + (nombre_feuilles n2)
        | _ -> 1 ;;

(* On remarque que nombre_feuilles = 1 + nombre_noeuds_internes *)
nombre_noeuds_internes expr1 ;;
nombre_feuilles expr1 ;;

(* 7 *)
let rec hauteur e = match e with 
        | N (_,n1,n2) -> 1 + max (hauteur n1) (hauteur n2) 
        | _ -> 0 ;;

(* 8 *)
let rec calcule e = match e with 
        | F f -> f 
        | N (op,n1,n2) -> let c1,c2 = calcule n1, calcule n2 in match op with 
                        | Plus  -> c1 +. c2
                        | Moins -> c1 -. c2
                        | Mult  -> c1 *. c2 
                        | Divi  -> c1 /. c2 ;;

(* 9 *)
let rec affiche e = match e with 
        | F f -> print_float f 
        | N (op,n1,n2) -> let c = match op with 
                        | Plus  -> " + "
                        | Moins -> " - "
                        | Mult  -> " * "
                        | Divi  -> " / " 
        in print_string " ( "; affiche n1; print_string c; affiche n2; print_string " ) ";;

(* 10 *)
type fonction_trigo = Cos | Sin | Tan ;; 

type expression2 = 
        | F of float
        | N1 of operateur * expression2 * expression2
        | N2 of fonction_trigo * expression2;;

let expr2 = N1 (Plus, N2 (Cos, N1 (Mult, F 2.5, N2 (Sin, F 1.))), N2 (Tan, N1 (Divi, F 5.3, F 1. )));; 

let rec nombre_noeuds2 e = match e with 
        | N2 (_,n1)    -> 1 + (nombre_noeuds2 n1)
        | N1 (_,n1,n2) -> 1 + (nombre_noeuds2 n1) + (nombre_noeuds2 n2)
        | _ -> 1 ;;

let rec nombre_noeuds_internes2 e = match e with 
        | N2 (_,n1)    -> 1 + (nombre_noeuds_internes2 n1)
        | N1 (_,n1,n2) -> 1 + (nombre_noeuds_internes2 n1) + (nombre_noeuds_internes2 n2)
        | _ -> 0 ;;

let rec nombre_feuilles2 e = match e with 
        | N2 (_,n1)    -> (nombre_feuilles2 n1)
        | N1 (_,n1,n2) -> (nombre_feuilles2 n1) + (nombre_feuilles2 n2)
        | _ -> 1 ;;

let rec hauteur2 e = match e with 
        | N2 (_,n1)    -> 1 + (hauteur2 n1)
        | N1 (_,n1,n2) -> 1 + max (hauteur2 n1) (hauteur2 n2) 
        | _ -> 0 ;;

let rec calcule2 e = match e with 
        | F f -> f 
        | N1 (op,n1,n2) -> ( let c1,c2 = calcule2 n1, calcule2 n2 in match op with 
                        | Plus  -> c1 +. c2
                        | Moins -> c1 -. c2
                        | Mult  -> c1 *. c2 
                        | Divi  -> c1 /. c2 ) 
        | N2 (f,n1) -> let c1 = calcule2 n1 in match f with 
                        | Cos -> cos c1
                        | Sin -> sin c1
                        | Tan -> tan c1 ;;

let rec affiche2 e = match e with 
        | F f -> print_float f 
        | N1 (op,n1,n2) -> ( let c = match op with 
                        | Plus  -> " + "
                        | Moins -> " - "
                        | Mult  -> " * "
                        | Divi  -> " / " 
        in print_string " ( "; affiche2 n1; print_string c; affiche2 n2; print_string " ) " )
        | N2 (f,n1) -> let c = match f with
                        | Cos -> "cos "
                        | Sin -> "sin "
                        | Tan -> "tan "
        in print_string c; affiche2 n1 ;;
calcule2 expr2;;
affiche2 expr2;;

(* 11 *)
type expression2 = 
        | X
        | F of float
        | N1 of operateur * expression2 * expression2
        | N2 of fonction_trigo * expression2;;

(* 12 *)
let rec remplace e u = match e with 
        | X -> u
        | F f -> f 
        | N1 (op,n1,n2) -> ( let c1,c2 = remplace n1 u, remplace n2 u in match op with 
                        | Plus  -> c1 +. c2
                        | Moins -> c1 -. c2
                        | Mult  -> c1 *. c2 
                        | Divi  -> c1 /. c2 ) 
        | N2 (f,n1) -> let c1 = remplace n1 u in match f with 
                        | Cos -> cos c1
                        | Sin -> sin c1
                        | Tan -> tan c1 ;;

let expr3 = N1 (Plus, N2 (Cos, N1 (Mult, F 2.5, N2 (Sin, X))), N2 (Tan, N1 (Divi, F 5.3, X )));;
remplace expr3 1.;;

(* 13 *)
type arbre = N of string * arbre list;;

let arbre1 = N("a",[
                   N("b", [
                          N("e",[]); 
                          N("f", [N("m",[])])
                          ]); 
                   N("c", [
                          N("g",[]); 
                          N("h",[]);
                          N("i",[]);
                          N("j",[])
                          ]);
                   N("d", [
                          N("k",[]); 
                          N("l", [N("n",[N("o",[])])])
                          ])
                   ]);;


