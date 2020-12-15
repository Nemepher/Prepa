let soc chars = let n = List.length chars and l = ref chars in 
        let a = String.create n in
        for i = 0 to n-1 do
                a.[i] <- List.hd !l;
                l := List.tl !l 
        done
;;

