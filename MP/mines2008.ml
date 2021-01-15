let max_poids = 100;;
let poids = [|[|0;1;10;5;4|];[|1;0;6;12;7|];[|10;6;0;2;3|];[|5;12;2;0;9|];[|4;7;3;9;0|]|];;


let plus_proche poids s x = let n = Array.length s in let poids_min = ref max_poids and px = ref n in  
        for i = 0 to n-1 do 
                if s.(i) then (
                        let poids_neuf = poids.(x).(i) in 
                                if poids_neuf = !poids_min then px := min x i; 
                                if poids_neuf < !poids_min then (px := i; poids_min := poids_neuf) 
                )
        done;
        !px
;;


let t = [|3;4;0;6;2;7;1;5|];;

let echange t i j = let aux = t.(i) in t.(i) <- t.(j); t.(j) <- aux;;

let deux_opt t i j = 
        for k = i+1 to (j-i)/2+1 do
                echange t k (j-k+i+1)
        done
;;
t;;
deux_opt t 1 6;;
t;;


