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
        for k = 0 downto n-1 do
                if k <> i && k <> j then b := k::!b
        done;
        u := !b :: !u;
        let _::_::suite = !b in 
        u := (i::j::suite) :: !u;
        !u
;; 

let mcgarvey m = let n = Array.length m and u = ref [] in 
        for i = 0 to n-1 do 
                for j = 0 to n-1 do 
                        let k = m.(i).(j)/2 in 
                        if k > 0 then let u2 = creer_urne i j n in 
                                for _ = 1 to k do u:=u2 @ !u done
                done
        done; 
        !u 
;;



