(* Option-MPSI --- TP6 --- Augustin Abert *)

(* 1 *)
let pile_vide () = [];;

let empile v p = v::p;;

let est_vide p = p=[];;

let depile p = match p with 
        | t::q -> q
        | _ -> failwith "pile vide";;

let sommet p = match p with
        | t::q -> t
        | _ -> failwith "pile vide";;

(* 2 --- La complexitée est à chasue fois en O(1), la longeur de la pile n'intervenant pas.*)

(* 3 *)
type rationnel = { mutable num : int ; mutable den : int} 

let simplification r = 
        let rec pgcd a b = if a = 0 then b else pgcd (b mod a) a in
        let p = pgcd r.num r.den in
        r.num <- r.num/p;
        r.den <- r.den/p;;

(* 4 *)
type ('a) file = {mutable debut: 'a list; mutable fin :'a list};;

let file_vide () = {debut=[]; fin=[]};;

let enfile e f = f.fin <- e::f.fin;;

let est_vide f = f.debut=[] && f.fin=[];; 

let rec defile f = match f with
        | {debut=[] ; fin=[] } -> failwith "pile vide"
        | {debut=t::h ; fin=_} -> f.debut <- h; h
        | {debut=[] ; fin=_  } -> f.debut <- List.rev f.fin; f.fin <- []; defile f;;

let rec premier f = match f with
        | {debut=[] ; fin=[] } -> failwith "pile vide"
        | {debut=t::h ; fin=_} -> f.debut <- h
        | {debut=[] ; fin=_  } -> f.debut <- List.rev f.fin; f.fin <- []; premier f;;

(* 5 *)
let afficher afficher_elem f = 
        let rec afficher_liste l = match l with 
                |[] -> ()
                |t::q -> afficher_elem t;print_string " "; afficher_liste q 
        in afficher_liste f.debut; afficher_liste (List.rev f.fin);;

(* Il est nécessaire de devoir fournir la fonction afficher_elem si l'on ne veut pas recourir à une fonction qui retrouverait le type de l'élément et l'afficherait avec la fonction correspondante *)

(* 6 *)

(* 7 *)
type ('a) file = {contenu : 'a array;
                  taile: int;
                  mutable nombre: int;
                  mutable tete: int;};;

let file_vide () = {contenu};;





