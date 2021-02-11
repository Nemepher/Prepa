type candidat = int;;
type bulletin = candidat list;;
type urne = bulletin list;;

let rec avant i j b = match b with 
        []                    ->failwith "bulletin incorrect"
        | c::suite when c = i -> 1
        | c::suite when c = j -> -1
        | _::suite            -> avant i j suite 
;;

let rec duel_aux i j u = match u with
        [] -> 0
        | b::suite -> avant i j b + duel_aux i j suite
;;

let duel i j u = if i=j then 0 else duel_aux i j u;;

let depouillement n u = let m = Array.make_matrix n n 0 in 
        for i = 1 to n-1 do 
                for j = 0 to i-1 do 
                        let score = duel i j u in
                        m.(i).(j) <- score;
                        m.(j).(i) <- - score;
                done
        done;
        m
;;

let u = [[2;0;1]; [2;1;0]; [1;2;0]];;
depouillement 3 u;;

let creer_urne i j n = let u = ref [] and b = ref [i;j] in 
        for k = n-1 downto 0 do
                if k <> i && k <> j then b := k::!b
        done;
        u := !b :: !u;
        let _::_::suite = List.rev !b in 
        u := (i::j::suite) :: !u;
        !u
;; 

let mcgarvey m = let n = Array.length m and u = ref [] in 
        for i = 0 to n-1 do 
                for j = 0 to n-1 do 
                        let k = m.(i).(j)/2 in 
                        if k > 0 then let u2 = creer_urne i j n in 
                                for _ = 1 to k do u := u2 @ !u done
                done
        done; 
        !u 
;;

let m = [|[|0;4;0|];[|-4;0;-2|];[|0;2;0|]|];;
mcgarvey m;;

let condorcet m = let n = Array.length m and vainqueurs = ref [] in 
        for i = 0 to n-1 do
                let j = ref 0 and score = ref 0 in 
                while !j <> n && !score >= 0 do 
                        score := m.(i).(!j);
                        incr j 
                done;
                if !j = n then vainqueurs := i :: !vainqueurs 
        done;
        !vainqueurs
;;

condorcet m;;

let intermediaire m = let n = Array.length m in 
        let m2 = Array.make_matrix n n 0 in 
                for i = 0 to n-1 do
                        m2.(i) <- Array.copy m.(i);
                        m2.(i).(i) <- 0
                done;
                for i = 0 to n-1 do
                        for j = 0 to n-1 do
                                for k = 0 to n-1 do 
                                        m2.(i).(j) <- max m2.(i).(j) (min m2.(i).(k) m2.(k).(j))                         
                                done
                        done
                done;
                m2
;;

intermediaire m;;
                                     
let schulze n u = condorcet (intermediaire (depouillement n u));;

schulze 3 u;;
