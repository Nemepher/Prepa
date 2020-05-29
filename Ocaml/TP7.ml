(* Option-MPSI --- TP7 --- Augustin Abert *)

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


(* 2 --- La complexité est à chaque fois en O(1), la longeur de la pile n'intervenant pas.*)

(* 3 *)
type rationnel = { mutable num : int ; mutable den : int} 

let simplification r = 
        let rec pgcd a b = if a = 0 then b else pgcd (b mod a) a in
        let p = pgcd r.num r.den in
        r.num <- r.num/p;
        r.den <- r.den/p;;

(* 4 *)
type 'a file = {mutable debut: 'a list; mutable fin :'a list};;

let file_vide () = {debut=[]; fin=[]};;

let enfile e f = f.fin <- e::f.fin;;

let est_vide f = f.debut=[] && f.fin=[];; 

let rec defile f = match f with
        | {debut=[] ; fin=[] } -> failwith "file vide"
        | {debut=t::h ; fin=_} -> f.debut <- h; t
        | {debut=[] ; fin=_  } -> f.debut <- List.rev f.fin; f.fin <- []; defile f;;

let rec premier f = match f with
        | {debut=[] ; fin=[] } -> failwith "file vide"
        | {debut=t::h ; fin=_} -> t
        | {debut=[] ; fin=_  } -> f.debut <- List.rev f.fin; f.fin <- []; premier f;;

(* 5 *)
let afficher afficher_elem f = 
        let rec afficher_liste l = match l with 
                |[] -> ()
                |t::q -> afficher_elem t;print_string " "; afficher_liste q 
        in afficher_liste f.debut; afficher_liste (List.rev f.fin);;

(* Il est nécessaire de devoir fournir la fonction afficher_elem si l'on ne veut pas recourir à une éventuelle fonction qui retrouverait le type de l'élément et l'afficherait avec la fonction correspondante *)

(* 6 --- Toute les opérations à part defile et premier sont en O(1). Ces deux dernières opérations sont au mieux en O(1) et au pire en O(n) avec n la longeur de la file (On défile la fin en l'enfilant sur le début) *)

(* 7 *)
type 'a file = {contenu : 'a array;
                  taille: int;
                  mutable nombre: int;
                  mutable tete: int;
                 };;

let file_vide n c  = {contenu = Array.make n c;
                      taille = n;
                      nombre = 0;
                      tete = 0;
                     };;

let enfile e f = if f.nombre >= f.taille then failwith "file pleine"; 
                 f.contenu.( (f.tete+f.nombre) mod f.taille ) <- e; 
                 f.nombre <- f.nombre + 1;;

let est_vide f  = f.nombre = 0;; 

let defile f = if f.nombre = 0 then failwith "file vide";
               f.tete <- (f.tete +1) mod f.taille; 
               f.nombre <- f.nombre-1; 
               f.contenu.( (f.tete + f.taille -1 ) mod f.taille );; 

let premier f = if f.nombre = 0 then failwith "file vide";
                f.contenu.(f.tete);;

(* 8 *)
let afficher afficher_elem f = 
        for i=0 to (f.nombre-1) do (
                afficher_elem f.contenu.( (f.tete+i) mod f.taille ); print_string " "
        ) done;; 

(* 9 ---  L'affichage d'une file se fait en O du nombre d'élémnet dans la file et le reste se fait en temps constant*) 

(* 10 --- La complexité des opérations de défilage sur les tableaux ont l'avantage de se faire en temps constant mais puisque leur taille est fixée à la création, on pourrait potentiellement manquer d'espace ou au contraire gacher de la mémoire en utilisant des tableaux trop longs. L'implémentation avec les doubles listes permet au contraire de stocker (théoriquement!) une infinité d'éléments. *)


