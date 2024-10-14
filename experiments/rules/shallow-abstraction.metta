 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data)
 ; ! (import! &self hyperon-miner:experiments:rules:binding-set)
 ; ! (import! &self hyperon-miner:experiments:utils:common-utils)
 ; ! (import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
 ; ! (bind! &shabspace (new-space))
 ; ! (bind! &bindspace (new-space))

 ;; Function to retrive shallow abstraction over all variables of a pattern from a valuation space
 ; (= (shallow-abstraction $valspace $shabspace)
 ;     (superpose (
 ;             (collapse (match $valspace (ValuationOf X $z) (add-atom $shabspace (ShallowAbstractionOf X $z))))
 ;             (collapse (match $valspace (ValuationOf Y $t) (add-atom $shabspace (ShallowAbstractionOf Y $t))))
 ;         )
 ; )
 ; )
 ; (= (depth) (fromNumber 1))

(= (shallow-abstraction Z ($link $x $y) $bindspace $dbspace $shabspace)
    (superpose (
            (collapse (match $bindspace (BindingOf X $s) (add-atom $shabspace (ShallowAbstractionOf (X ($link)) $s))))
            (collapse (match $bindspace (BindingOf Y $t) (add-atom $shabspace (ShallowAbstractionOf (Y ($link)) $t))))
        )
)
)

 ; (= (shallow-abstraction (S $k) ($link $x $y) $bindspace $dbspace $shabspace)
 ;     (superpose (
 ;             (if (== (get-metatype $x) Expression)
 ;                 (match $dbspace ($link $x $y)
 ;                     (match $dbspace ($link ($linki $z $w) $y)
 ;                         (match $bindspace (BindingOf X $s) (add-reduct $shabspace (ShallowAbstractionOf (X ($link ($linki))) $s)))
 ;                     ))
 ;             (match $bindspace (BindingOf X $s) (add-atom $shabspace (ShallowAbstractionOf (X ($link)) $s)))
 ;         )
 ;     (if (== (get-metatype $y) Expression)
 ;         (match $dbspace ($link $x $y)
 ;             (match $dbspace ($link $x ($linki $z $w))
 ;                 (match $bindspace (BindingOf Y $t) (add-reduct $shabspace (ShallowAbstractionOf (Y ($link ($linki))) $t)))
 ;             ))
 ;     (match $bindspace (BindingOf Y $t) (add-atom $shabspace (ShallowAbstractionOf (Y ($link)) $t)))
 ; )))
 ; )
(= (shallow-abstraction (S $k) ($link $x $y) $bindspace $dbspace $shabspace)
    (superpose (
            (match $bindspace (BindingOf X $s)
                (match $dbspace ($link ($linki $s $w) $y) (superpose ( (remove-atom $shabspace (ShallowAbstractionOf (X ($link ($linki))) $s)) (add-atom $shabspace (ShallowAbstractionOf (X ($link ($linki))) $s)))))
            )
        (match $bindspace (BindingOf Y $t)
            (match $dbspace ($link ($linki $z $t) $y) (superpose ( (remove-atom $shabspace (ShallowAbstractionOf ( ($link ($linki)) Y) $t)) (add-atom $shabspace (ShallowAbstractionOf ( ($link ($linki)) Y) $t)))))
        )
    (match $bindspace (BindingOf X $s)
        (match $dbspace ($link $x ($linki $s $w)) (superpose ( (remove-atom $shabspace (ShallowAbstractionOf ( ($link ($linki)) X) $s)) (add-atom $shabspace (ShallowAbstractionOf ( ($link ($linki)) X) $s)))))
    )
(match $bindspace (BindingOf Y $t)
    (match $dbspace ($link $x ($linki $w $t))
        (superpose ( (remove-atom $shabspace (ShallowAbstractionOf (Y ($link ($linki))) $t)) (add-atom $shabspace (ShallowAbstractionOf (Y ($link ($linki))) $t)))))
)

)
)
)

 ; ! (binding-set (depth) (Inheritance (And (And C D) R) $yvalue) &dbspace &bindspace)

 ;  ; Check if binding sets are inserted correctly
 ; ! (match &bindspace (BindingOf $v $s) (BindingOf $v $s))

 ;  ; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
 ; ! (shallow-abstraction (depth) (Inheritance (And (And C D) R) $yvalue) &bindspace &dbspace &shabspace)

 ;  ; Check if shallow abstractions are inserted correctly
 ; ! (match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))