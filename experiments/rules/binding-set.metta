 ; ! (register-module! ../../../hyperon-miner)
 ; ! (import! &dbspace hyperon-miner:experiments:data:sample-data)
 ; ! (import! &self hyperon-miner:experiments:utils:common-utils)
 ; ! (import! &self hyperon-miner:experiments:utils:DeBruijnIndex)
 ; ! (bind! &bindspace (new-space))

 ;; Satisfying set Implementation
(= (satisfying-set $x $db) (match $db $x $x))

 ;; test satisfying-set Implementation
 ;!(satisfying-set (Inheritance $x $y) &dbspace)

 ;; Binding set Implementation
 ; (= (depth) (fromNumber 1))

(= (binding-set Z ($link $x $y) $dbspace $bindspace) (superpose (
            (superpose (
                    (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-atom $bindspace (BindingOf X $x)))))
                    (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-atom $bindspace (BindingOf Y $y)))))
                ))
    )

)
)

(= (binding-set (S $k) ($link $x $y) $dbspace $bindspace)
    (superpose (
            (if (== (get-metatype $x) Expression)
                (match $dbspace ($link $x $y)
                    (match $dbspace ($link ($linki $z $w) $y)
                        (superpose (
                                (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z))
                                (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w))))))
                (match $dbspace ($link $x $y)
                    (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-reduct $bindspace (BindingOf X $x)))))
            )
        (if (== (get-metatype $y) Expression)
            (match $dbspace ($link $x $y)
                (match $dbspace ($link $x ($linki $z $w))
                    (superpose (
                            (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w))
                            (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z))))))
            (match $dbspace ($link $x $y)
                (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-reduct $bindspace (BindingOf Y $y)))))
        )))
)
 ; ! (binding-set (depth) (Inheritance (And (And C D) R) $yvalue) &dbspace &bindspace)

 ;  ; Check if binding sets are inserted correctly
 ;  ; ! (match &bindspace $h $h)
 ; ! (match &bindspace (BindingOf $v $s) (BindingOf $v $s))
