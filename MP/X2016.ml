(*List. iter map fold_left fold_right*)

type litteral =
        |V of int 
        |NV of int;;
type clause = litteral list;;
type fnc = clause list;;

let rec maxc (c:clause) = match c with
        [] -> -1
        | (V x)::suite | (NV x)::suite  -> max x (maxc suite)
;;

let var_max (f:fnc) = List.fold_left max 0 (List.map maxc f);;

type trileen = 
        |Vrai 
        |Faux
        |Indetermine;;

let test sigma (l:litteral) = match l with 
        V x when sigma.(x) <> Faux -> sigma.(x) <- Vrai; true
      | NV x when sigma.(x) <> Vrai -> sigma.(x) <- Faux; true
      | _ -> false
;;

let un_sat (f:fnc) = let sigma = Array.make (1 + var_max f) Indetermine in
        let fold_fun b (c:clause) = b && test sigma (List.hd c) in
        List.fold_left fold_fun true f
;;

un_sat [[V (2)];[NV 2]];;

type graphe = int list array;;

(*
let renverser_graphe (g:graphe) = 
        let n = Array.length g in 
        let rg = Array.make n [] in  
        for i = 0 to n-1 do
                rg.(i) <- g.(n-1-i)
        done;
        rg
;;
*)
let rec renverser_graphe_aux i g g gr = 
        let fils = ref g.(i) in  

let renverser_graphe (g:graphe) = 
        let n = Array.length g in 
        let rg = Array.make n [] in 
        

