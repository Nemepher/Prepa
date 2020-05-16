(* Option-MPSI --- TP6 --- Augustin Abert *)

(* 1 *)
let sacados0 w p t = 
        let n = Array.length w in
        let rec aux i j = match i,j with
                | 0,_ -> 0
                | _,0 -> 0
                | _,_ when j >= w.(i-1) -> max (aux (i-1) j) (p.(i-1) + aux (i-1) (j-w.(i-1)) )
                | _,_ -> aux (i-1) j
        in aux n t;;

sacados0 [|4;10;1;12;1;2|] [|8;2;1;4;2;2|] 15;; (* Suffisant lorsqu'il y a peu d'objets... *)
(*sacados0 [|1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2;1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2|] [|4;5;6;7;2;1;5;2;4;5;6;7;2;1;5;2;7;8;3;4;5;4;5;5;7;8;3;4;5;4;5;5|] 60;;*)
(*... mais à force de tout recalculer, devient assez vite désastreux !*)

(* 2 *)
let sacados1 w p t =
        let n = Array.length w in
        let u = Array.make_matrix (n+1) (t+1) 0 in
        for i=1 to n do
                for j=1 to t do
                        if j >= w.(i-1) then u.(i).(j) <- max u.(i-1).(j) (p.(i-1) + u.(i-1).(j-w.(i-1))) 
                        else  u.(i).(j) <- u.(i-1).(j)
                done;
        done;u.(n).(t);;

sacados1 [|4;10;1;12;1;2|] [|8;2;1;4;2;2|] 15;; 
sacados1 [|1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2;1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2|] [|4;5;6;7;2;1;5;2;4;5;6;7;2;1;5;2;7;8;3;4;5;4;5;5;7;8;3;4;5;4;5;5|] 60;;

(* 3 *)
let sacados2 w p t =   
        let n = Array.length w in
        let u = Array.make_matrix (n+1) (t+1) (-1) in
        let rec aux i j = match i,j with
                | 0,_ -> 0
                | _,0 -> 0
                | _ -> if u.(i).(j) = -1 then begin
                        if j >= w.(i-1) then u.(i).(j) <- max (aux (i-1) j) (p.(i-1) + aux (i-1) (j-w.(i-1)) )
                        else u.(i).(j) <- aux (i-1) j
                end; u.(i).(j) 
                        
        in aux n t;;



sacados2 [|4;10;1;12;1;2|] [|8;2;1;4;2;2|] 15;; 
sacados2 [|1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2;1;2;3;2;4;6;1;9;6;6;8;1;4;6;9;2|] [|4;5;6;7;2;1;5;2;4;5;6;7;2;1;5;2;7;8;3;4;5;4;5;5;7;8;3;4;5;4;5;5|] 60;;

(* 4 *)
let contenu w p t =
        let n = Array.length w in
        let u = Array.make_matrix (n+1) (t+1) 0 in
        for i=1 to n do
                for j=1 to t do
                        if j >= w.(i-1) then u.(i).(j) <- max u.(i-1).(j) (p.(i-1) + u.(i-1).(j-w.(i-1))) 
                        else  u.(i).(j) <- u.(i-1).(j)
                done;
        done;
        let l= ref t in
        for i=0 to (n-1) do
                if u.(n-i).(!l)>u.(n-i-1).(!l) then (print_int (n-i-1);print_string " ";l:=!l-w.(n-i-1))
        done;;

contenu [|4;10;1;12;1;2|] [|8;2;1;4;2;2|] 15;; 

(* 5 *)
let max3 a b c = max a (max b c);;

(* 6 *)
let kronecker a b = if a=b then 1 else 0;;

let score0 x y = 
        let rec aux i j = match i,j with
                | _,0 -> -i
                | 0,_ -> -j
                | _,_ -> max3 (aux (i-1) j) (aux i (j-1)) (aux (i-1) (j-1) + 5*(kronecker x.[i-1] y.[j-1])) -1
        in aux (String.length x ) (String.length y );;

score0 "gradient" "radis";; (* Trop long pour des chaines plus longues !*)

(* 7 *)
let score1 x y =
        let lx,ly = String.length x, String.length y in
        let u = Array.make_matrix (lx+1) (ly+1) 0 in
        for i=1 to lx do u.(i).(0) <- -i done;
        for j=1 to ly do u.(0).(j) <- -j done;
        for i=1 to lx do
                for j=1 to ly do
                        u.(i).(j) <- max3 u.(i-1).(j) u.(i).(j-1) (u.(i-1).(j-1) + 5*(kronecker x.[i-1] y.[j-1])) -1
                done;
        done;u.(lx).(ly);;

score1 "retropropagation" "proposition";;  (* Attention aux caractères spéciaux qui peuvent prend deux char dans une string !! *)    

(* 8 *)
type marque = Nord | Ouest | NordOuest ;;



let alignement x y =
        
        (* On remplit les deux tableaux *)
        let lx,ly = String.length x, String.length y in
        let u = Array.make_matrix (lx+1) (ly+1) 0 in
        let r = Array.make_matrix (lx+1) (ly+1) NordOuest in
        for i=1 to lx do u.(i).(0) <- -i; r.(i).(0) <- Nord done;
        for j=1 to ly do u.(0).(j) <- -j; r.(0).(j) <- Ouest done;
        for i=1 to lx do
                for j=1 to ly do
                        u.(i).(j) <- max3 u.(i-1).(j) u.(i).(j-1) (u.(i-1).(j-1) + 5*(kronecker x.[i-1] y.[j-1])) -1;
                        if u.(i).(j) = (u.(i-1).(j)-1) then r.(i).(j) <- Nord;
                        if u.(i).(j) = (u.(i).(j-1)-1) then r.(i).(j) <- Ouest 
                done;
        done;
        
        (* On en extrait l'alignement optimal *)
        let m = Array.make_matrix 2 (lx+ly) ' ' in
        let i,j,n = ref lx,ref ly,ref 1 in
        while (!i>0 || !j>0) do
                match r.(!i).(!j) with
                        | Nord  -> i:=!i-1;          n:=!n+1; m.(0).(lx+ly- !n) <- x.[!i] ; m.(1).(lx+ly- !n) <- '-' 
                        | Ouest ->          j:=!j-1; n:=!n+1; m.(0).(lx+ly- !n) <- '-' ;    m.(1).(lx+ly- !n) <- y.[!j]
                        | _     -> i:=!i-1; j:=!j-1; n:=!n+1; m.(0).(lx+ly- !n) <- x.[!i] ; m.(1).(lx+ly- !n) <- y.[!j]
        done;
       
         (* On affiche cet alignement *)
        print_string "\n" ;
        for l=(lx+ly- !n) to (lx+ly-1) do
                print_char m.(0).(l)
        done; print_string "\n";        
        for l=(lx+ly- !n) to (lx+ly-1) do
                print_char m.(1).(l)
        done; print_string "\n";u.(lx).(ly);;

alignement "gradient" "radis";;
alignement "atgcaacttg" "atcatatta";;
alignement "retropropagation" "proposition";;    
alignement "ainphormatik" "informatique";;

(* 9 *)
let transfo x y =
        
        (* On remplit les deux tableaux *)
        let lx,ly = String.length x, String.length y in
        let u = Array.make_matrix (lx+1) (ly+1) 0 in
        let r = Array.make_matrix (lx+1) (ly+1) NordOuest in
        for i=1 to lx do u.(i).(0) <- -i; r.(i).(0) <- Nord done;
        for j=1 to ly do u.(0).(j) <- -j; r.(0).(j) <- Ouest done;
        for i=1 to lx do
                for j=1 to ly do
                        u.(i).(j) <- max3 u.(i-1).(j) u.(i).(j-1) (u.(i-1).(j-1) + 5*(kronecker x.[i-1] y.[j-1])) -1;
                        if u.(i).(j) = (u.(i-1).(j)-1) then r.(i).(j) <- Nord;
                        if u.(i).(j) = (u.(i).(j-1)-1) then r.(i).(j) <- Ouest 
                done;
        done;
        
        (* On en extrait l'alignement optimal *)
        let m = Array.make_matrix 2 (lx+ly) ' ' in
        let i,j,n = ref lx,ref ly,ref 1 in
        while (!i>0 || !j>0) do
                match r.(!i).(!j) with
                       | Nord  -> i:=!i-1;          n:=!n+1; m.(0).(lx+ly- !n) <- x.[!i] ; m.(1).(lx+ly- !n) <- '-' 
                       | Ouest ->          j:=!j-1; n:=!n+1; m.(0).(lx+ly- !n) <- '-' ;    m.(1).(lx+ly- !n) <- y.[!j]
                       | _     -> i:=!i-1; j:=!j-1; n:=!n+1; m.(0).(lx+ly- !n) <- x.[!i] ; m.(1).(lx+ly- !n) <- y.[!j]
        done;
                
        (* On affiche les opérations plutot que directement l'alignement *)
        print_string "\nChaîne de départ --> "; print_string x;

        for k=(lx+ly- !n) to (lx+ly-1) do
               if m.(0).(k) !=  m.(1).(k) then begin
               (match m.(0).(k),m.(1).(k) with
                        | '-',_ -> print_string "\n---- insertion ----> "
                        | _,'-' -> print_string "\n---- deletion -----> "
                        | _ -> print_string "\n---- substitution -> ");                       
               m.(0).(k) <- m.(1).(k);   
               for l=(lx+ly- !n) to (lx+ly-1) do if m.(0).(l) != '-' then print_char m.(0).(l) done;
               end
        done;;


transfo "gradient" "radis";;
transfo "retropropagation" "proposition";;    
transfo "ainphormatik" "informatique";;  
