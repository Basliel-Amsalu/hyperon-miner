 ;; Rule to specialization a pattern
 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data)
 ; ! (import! &self hyperon-miner:experiments:rules:binding-set)
 ; ! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
 ; ! (import! &self hyperon-miner:experiments:utils:common-utils)
 ; ! (import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
 ; ! (bind! &shabspace (new-space))
 ; ! (bind! &bindspace (new-space))
 ; ! (bind! &spezspace (new-space))

 ; (= (specialize-pattern $link $x $y $shabspace $spezspace) (
 ;         superpose (
 ;             (match $shabspace (ShallowAbstractionOf X $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $t $y))))
 ;             (match $shabspace (ShallowAbstractionOf Y $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x $t))))
 ;         )
 ; )
 ; )
 ; (= (depth) (fromNumber 1))
(= (specialize-pattern Z $shabspace $spezspace) (
        superpose (
            (match $shabspace (ShallowAbstractionOf (X $link) $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $t $y))))
            (match $shabspace (ShallowAbstractionOf (Y $link) $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x $t))))
        )
)
)
(= (specialize-pattern (S $k) $shabspace $spezspace) (
        superpose (
            (match $shabspace (ShallowAbstractionOf (X ($link ($linki))) $s) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($linki $s $w) $y))))
            (match $shabspace (ShallowAbstractionOf (Y ($link ($linki))) $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x ($linki $z $t)))))
            (match $shabspace (ShallowAbstractionOf ( ($link ($linki)) X) $s) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link $x ($linki $s $w)))))
            (match $shabspace (ShallowAbstractionOf ( ($link ($linki)) Y) $t) (add-atom $spezspace (SpecializationOf ($link $x $y) ($link ($linki $z $t) $y))))
        )
)
)

 ;  ; First, let's run the valuation-set function to populate the &valspace with the valuation sets
 ; ! (binding-set (depth) (Inheritance $xvalue (Or P O)) &dbspace &bindspace)

 ;  ; Check if binding sets are inserted correctly
 ; ! (match &bindspace (BindingOf $v $s) (BindingOf $v $s))

 ;  ; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
 ; ! (shallow-abstraction (depth) (Inheritance $xvalue (Or P O)) &bindspace &dbspace &shabspace)

 ;  ; Check if shallow abstractions are inserted correctly
 ; ! (match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))

 ;  ; Let's now run the specialization rule
 ; ! (specialize-pattern (depth) $x $y &shabspace &spezspace)

 ;  ; Check if the specializations are inserted correctly
 ; ! (match &spezspace (SpecializationOf $x $y) (SpecializationOf $x $y))
