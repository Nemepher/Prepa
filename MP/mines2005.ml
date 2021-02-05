type graphe = {nb_sommets : int; fils : int list array};;
type clause = {a: int; b: int};;
type formule = {nb_var : int; clause : clause list};;

let g={nb_sommets = 2; fils = [|[1]|]};;
let f={nb_var=2; clause= [{a=0;b=0};{a=1;b=0}]};;

let rec marquage g r marques = 
        marques.(r) <- true;
        let fils = ref g.fils.(r) in 
        while !fils <> [] do 
                let sommet = List.hd !fils in
                        if not marques.(sommet) then 
                                marquage g sommet marques;
                        fils := List.tl !fils 
        done
;;

let calcul_descendants g r =
        let marques = Array.make g.nb_sommets false in 
                marquage g r marques;
                marques
;;

let barre alpha p = (alpha+p) mod 2*p;;

let transformer f = 
        let fils = Array.make (2*f.nb_var) [] in
        let clauses = ref f.clause in 
        while !clauses <> [] do
                let c = List.hd !clauses in 
                let l = fils.(barre c.a f.nb_var) in fils.(barre c.a f.nb_var) <- c.b::l;
                let l = fils.(barre c.b f.nb_var) in fils.(barre c.b f.nb_var) <- c.a::l;
                clauses := List.tl !clauses
        done;
        {nb_sommets = 2*f.nb_var; fils=fils}
;;

transformer f;;

let rec retirer_aux clauses alpha p = match clauses with 
        [] -> []
      | c::suite when c.a = alpha || c.b = alpha || barre c.a p = alpha || barre c.b p = alpha -> retirer_aux suite alpha p
      | c::suite -> c::(retirer_aux suite alpha p)
;;

let retirer f alpha = {nb_var = f.nb_var; clause = retirer_aux f.clause alpha f.nb_var};;

let satisfiable f solution = let formule = ref f and sat = ref true in
        while !formule.clause <> [] && !sat = true do 
        let  p = !formule.nb_var and g = transformer !formule in
                let a = (List.hd !formule.clause).a in 
                let marques = calcul_descendants g a in
                        if marques.(barre a p) then begin if (calcul_descendants g (barre a p)).(a) then sat := false end 
                        else (
                                for i = 0 to 2*p - 1 do 
                                        if marques.(i) then formule := retirer !formule i
                                done 
                        )
        done;
        !sat
;;

satisfiable f [||];;


(*
 Tant qu'il reste des litteraux :
        - si il existe un chemin de a vers abarre et abarre vers a alors f est non satisfiable
        - sinon, on considere le chemin non existant :
                * on realise un parcousrs en profondeur a partir de ce point 
                * on retire chaque litteral rencontré dans le parcours
        (reste a voir comment remplir solution) 
 *)


