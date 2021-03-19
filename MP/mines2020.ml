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

let est_present (theta:creux) u = let (v,_,i,a) = theta in a.(u) <= v && i.(a.(u)) = u;;

let incremente_tableaucreux (theta:creux) u = let (_,f,_,_) = theta in f.(u) <- f.(u) + 1;;

let make_creux = (0,Array.make lambda 0,Array.make lambda 0,Array.make lambda 0);; 
 
let cree_tableau_creux t = 
        






