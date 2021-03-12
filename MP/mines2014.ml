let mult a b = let d = Array.length a in let ab = Array.make_matrix d d false in 
        for i = 0 to d-1 do 
                for j = 0 to d-1 do
                        let k = ref 0 in 
                        while !k < d && ab.(i).(j) = false do
                                ab.(i).(j) <- a.(i).(!k) && b.(!k).(j);
                                incr k 
                        done
                done
        done; 
        ab
;;

let rec pow a n = if n = 1 then a else mult a (pow a (n-1));;
let ft a = pow a (Array.length a -1);;

let deduction1 a i = let n = Array.length a in let marque = Array.make n false and pile = ref [i] in 
        while !pile <> [] do 
                let k::suite = !pile in 
                marque.(k) <- true;
                pile := suite; 
                for j = 0 to n-1 do 
                        if a.(k).(j) && marque.(j) = false then pile := j::!pile 
                done
        done;
        marque
;;

let rec deduction_aux a marque n k = 
        marque.(k) <- true; 
        for j = 0 to n-1 do 
                if a.(k).(j) && marque.(j) = false then deduction_aux a marque n j 
        done
;;
let deduction a i = let n = Array.length a in let marque = Array.make n false in deduction_aux a marque n i; marque;;

let ftbis a = let n = Array.length a in let b = Array.make_matrix n n false in 
        for i = 0 to n-1 do 
                b.(i) <- deduction a i 
        done;
        b
;;

let est_axiome b i = let n = Array.length b and axiome = ref true in 
        let j = ref 0 in 
        while !j < n && !axiome = true do 
                axiome := (not b.(i).(!j)) || b.(!j).(i)
        done;
        !axiome
;;

let axiomatique b = let n = Array.length b in let chois = Array.make n true and res = ref [] in 
        let i = ref 0 in 
        while !i<n do 
                if chois.(!i) && est_axiome b !i then begin 
                        res := !i::!res;  
                        for j = 0 to n-1 do 
                                if chois.(j) && b.(j).(!i) then chois.(j) <- false 
                        done end;
                incr i 
        done;
        !res
;;


