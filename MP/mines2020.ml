type unicode = int;;
type texte = unicode list;;
let lambda = 1114112;;
type repartition = (unicode * int) list;;

let rec fonction1 t = 
        match t with 
        | [] -> Array.make lambda 0
        | u::tprime -> let theta = fonction1 tprime in theta.(u) <- theta.(u) +1;theta
;;

let cree_repartition t = 
        let theta = fonction1 t;
        and res = ref [] in 
        for u=0 to lambda-1 do 
                if theta.(u)>0 then res:= (u,theta.(u))::!res
        done;
        !res
;;

let rec incremente_repartition r u = match r with 
        []                      -> [(u,1)]
        | (a,n)::suite when a=u -> (a,n+1)::suite 
        | _::suite              -> incremente_repartition suite u
;;

let rec cree_modulaire_aux res t m = match t with 
        [] -> res
        | u::suite -> let l = u mod m in res.(l) <- incremente_repartition res.(l) u; cree_modulaire_aux res suite m
;;
let cree_modulaire t m = let res = Array.make m [] in cree_modulaire_aux res t m;;
        
let rec valence tr = match tr with 
        [] -> 0
        | r::suite -> Array.length r + valence suite
;;

type creux = int * int array * unicode array * unicode array;;

let est_present (theta:creux) (u:unicode) = let (v,_,i,a) = theta in a.(u) <= v && i.(a.(u)) = u;;

let incremente_tableaucreux (theta:creux) (u:unicode) = let (v,f,i,a) = theta in 
        if est_present theta u then (f.(u) <- f.(u) + 1; theta)
        else (
                f.(u) <- 1;
                a.(u) <- v;
                i.(v) <- u;
                (v+1,f,i,a)
        )
;;

let make_creux:creux = (0, Array.make lambda 0, Array.make lambda 0, Array.make lambda 0);; 

incremente_tableaucreux make_creux 4;;

let rec cree_tableau_creux (t:texte) :creux = match t with 
        []       -> make_creux
      | u::suite -> incremente_tableaucreux (cree_tableau_creux suite) u
;;   

type binaire = bool list;;
type code =
        | Nil 
        | Noeud of unicode * binaire * code * code;;

let rec parcours (u:unicode) (c:code) = match c with 
        Nil -> failwith "dommage..."
      | Noeud (s,b,_,_) when s=u -> b
      | Noeud (s,_,c2,_) when s>u -> parcours u c2
      | Noeud (s,_,_,c2)         -> parcours u c2
;; 

let rec encodeur (t:texte) (c:code) = match t with 
        []       -> [] 
      | u::suite -> let b = parcours u c in b:: encodeur suite c
;; 
