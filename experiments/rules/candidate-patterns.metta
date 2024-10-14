 ;; Rule to add candidate patterns to the candidate space
! (register-module! ../../../hyperon-miner)
! (import! &dbspace hyperon-miner:experiments:data:sample-data)
! (import! &self hyperon-miner:experiments:rules:binding-set)
! (import! &self hyperon-miner:experiments:rules:shallow-abstraction)
! (import! &self hyperon-miner:experiments:rules:specialization)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
! (bind! &shabspace (new-space))
! (bind! &bindspace (new-space))
! (bind! &spezspace (new-space))
! (bind! &cndpspace (new-space))

(= (depth) (fromNumber 1))

(= (candidate-pattern $dbspace $spezspace $minsup $cndpspace)
    (match $spezspace (SpecializationOf $pattern ($link $x $y))
        (let $result (sup-eval $dbspace ($link $x $y) $minsup)
            (superpose ( (remove-atom $cndpspace $result) (add-atom $cndpspace $result)))
        )
)
)
 ; First, let's run the valuation-set function to populate the &valspace with the valuation sets
! (binding-set (depth) (Inheritance $xvalue (Or P O)) &dbspace &bindspace)

 ; Check if binding sets are inserted correctly
! (match &bindspace (BindingOf $v $s) (BindingOf $v $s))

 ; let's run the shallow-abstraction function to calculate the shallow abstraction over both variable X and Y
! (shallow-abstraction (depth) (Inheritance $xvalue (Or P O)) &bindspace &dbspace &shabspace)

 ; Check if shallow abstractions are inserted correctly
! (match &shabspace (ShallowAbstractionOf $c $d) (ShallowAbstractionOf $c $d))

 ; Let's now run the specialization rule
! (specialize-pattern (depth) &shabspace &spezspace)

 ; Check if the specializations are inserted correctly
! (match &spezspace (SpecializationOf $x $y) (SpecializationOf $x $y))

! (candidate-pattern &dbspace &spezspace 2 &cndpspace)

! (match &cndpspace $h $h)
