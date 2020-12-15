let max_val = 10;; 

let tri_max tableau = let n, occurences = tableau.(0), Array.make max_val 0 in 
        for i = 1 to n+1 do 
                occurences.( tableau.(i) ) <- occurences.( tableau.(i) ) + 1
        done;
        let j = ref 0 in 
        for i = 1 to n+1 do 
                while occurences.(!j) = 0 do
                        incr j 
                done;
                tableau.(i) <- !j;
                occurences.(!j) <- occurences.(!j) - 1
        done
;;

let tableau = Array.make 50 0;;
tableau.(0) <- 15;;
for i = 1 to 16 do
        tableau.(i) <- Random.int(max_val)
done;;
tableau;;
tri_max tableau;;
tableau;;
