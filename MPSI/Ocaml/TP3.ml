(* Option-MPSI --- TP3 --- Augustin Abert *)

(* 1 *)
let rec produit_liste liste = match liste with
                | h::t -> h * produit_liste t
                | _ -> 1 ;;

(* 2 *)
let rec dernier l = match l with
        |h::[] -> h 
        |_::t  -> dernier t
        | _ -> failwith "liste vide";;

(* 3 *)
let rec nieme l n = match n,l with 
        |0,h::_ -> h
        |_,_::t -> nieme t (n-1) 
        |_,_ -> failwith "n trop grand ou negatif";;

(* 4 *)
let rec insere_fin x l = match l with 
        |[] -> x::[]
        |h::t -> h:: insere_fin x t;;

(* 5 *)
let rec insere x l n = match n,l with
        |0,h::t -> x::h::t
        |_,h::t -> h:: insere x t (n-1)
        |_,_ -> failwith "n trop grand ou negatif";;

(* 6 *)
let rec remplace x l n = match n,l with 
        |0,_::t -> x::t
        |_,h::t -> h:: remplace x t (n-1)
        |_,_ -> failwith "n trop grand ou negatif";;

(* 7 *)
let rec supprime n l = match n,l with
        |0,h::t -> t
        |_,h::t -> h:: supprime (n-1) t
        |_,_ -> failwith "n trop grand ou negatif";;

(* 8 *)
let rec compare l1 l2 = match l1,l2 with
        |[],[] -> 0
        |[],_ -> 2
        |_,[] -> 1
        |_::t1,_::t2 -> compare t1 t2;;

(* 9 *)
let rec premiere_projection l = match l with 
        |h::[] -> fst h::[]
        |h::t -> fst h::premiere_projection t
        |_ -> failwith "liste vide";;

(* 10 *)
let rec recherche_supprime x l = match l with 
        |h::t when h=x -> recherche_supprime x t
        |h::t -> h::recherche_supprime x t
        |_ -> [];;

(* 11 *)
let petit liste = 
        let rec aux l p = match l with 
                |h::t when h = p -> aux t (p+1)
                |h::t -> aux t p
                |[] -> p
        in aux liste 0;;

(* 12 *)
let rec evalue p x = match p with
        |h::t -> h +. x *. (evalue t x)
        |[] -> 0.0 ;;

(* 13 --- La méthode de Horner evite d'avoir a recalculer chaque puissance ! (Et est plus simple...) *)
let evalue_naive p x =
        let rec aux p x n = match p with
                |h::t -> h *. x**n +. aux t x (n+.1.)
                |[] -> 0.
        in aux p x 0.;;

(* 14 *)
let rec concatene_miroir l1 l2 = match l2 with
        |h::t -> concatene_miroir (h::l1) t
        |[] -> l1;;

(* 15 --- La fonction rev (du module List) prend en argument une liste et renvoie une liste contenant les elements de la premiere liste dans l'ordre inverse.
 * Cette fonction parcours une fois la liste et copie tous les elements une fois. Sa complexitée est donc lineaire en fonction de la longueur de la liste *)
let rev = concatene_miroir [];;

(* 16 *)
let index x l = 
        let rec aux x l n = match l with 
                |h::_ when h=x -> n
                |h::t -> aux x t (n+1)
                |[] -> failwith "Not_found"
        in aux x l 0;; 

(* 17 *)
let index2 x l = 
        let rec aux x l n = match l with 
                |h::t when h=x -> n::aux x t (n+1)
                |h::t -> aux x t (n+1)
                |[] -> []
        in aux x l 0;; 







