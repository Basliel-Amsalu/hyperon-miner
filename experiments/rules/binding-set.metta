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
 ; (= (binding-set ($link $x $y) $dbspace $bindspace) (superpose (
 ;             (println! ($link $x $y))
 ;             (println! (get-metatype $x))
 ;             (println! (get-metatype $y))
 ;              ; (if (or (== (get-metatype $x) Expression) (== (get-metatype $y) Expression))
 ;              ;     (superpose (
 ;              ;             (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-atom $bindspace (BindingOf X $x)))))
 ;              ;             (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-atom $bindspace (BindingOf Y $y)))))
 ;              ;             (let ($linkz $xz $yz) (match $dbspace ($link $x $y) ($link $x $y))
 ;              ;                 (superpose ( (binding-set $xz $dbspace $bindspace)
 ;              ;                        (binding-set $yz $dbspace $bindspace))))
 ;              ;         )
 ;              ; )
 ;             (superpose (
 ;                     (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-atom $bindspace (BindingOf X $x)))))
 ;                     (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-atom $bindspace (BindingOf Y $y)))))
 ;                 ))
 ;     )
 ;  ; )
 ; )
 ; )

 ; (= (depth) (fromNumber 1))

(= (binding-set Z ($link $x $y) $dbspace $bindspace) (superpose (
            (superpose (
                    (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-atom $bindspace (BindingOf X $x)))))
                    (match $dbspace ($link $x $y) (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-atom $bindspace (BindingOf Y $y)))))
                ))
    )

)
)

 ; (= (binding-set (S $k) ($link $x $y) $dbspace $bindspace)
 ;     (superpose (
 ;             (println! (here))
 ;             (println! (get-metatype $x))
 ;             (println! (get-metatype $y))
 ;             (println! ($link $x $y))
 ;             (match $dbspace ($link $x $y)
 ;                 (superpose (
 ;                         (if (== (get-metatype $x) Expression)
 ;                             (match $dbspace ($link ($linki $z $w) $y) (superpose ( (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z)) (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w)))))
 ;                             (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-atom $bindspace (BindingOf X $x))))
 ;                         )
 ;                     (if (== (get-metatype $y) Expression)
 ;                         (match $dbspace ($link $x ($linki $z $w)) (superpose ( (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w)) (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z)))))
 ;                         (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-atom $bindspace (BindingOf Y $y))))
 ;                     )))
 ;     )
 ; )

 ; )
 ; )

 ; (= (binding-set (S $k) ($link $x $y) $dbspace $bindspace)
 ;     (superpose (
 ;             (if (== (get-metatype $x) Expression)
 ;                 (match $dbspace ($link $x $y)
 ;                     (let ($linki $z $w) (match $dbspace ($link ($linki $z $w) $y) ($linki $z $w))
 ;                         (superpose (
 ;                                 (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z))
 ;                                 (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w))))))
 ;                 (match $dbspace ($link $x $y)
 ;                     (superpose ( (remove-atom $bindspace (BindingOf X $x)) (add-reduct $bindspace (BindingOf X $x)))))
 ;             )
 ;         (if (== (get-metatype $y) Expression)
 ;             (match $dbspace ($link $x $y)
 ;                 (let ($linki $z $w) (match $dbspace ($link $x ($linki $z $w)) ($linki $z $w))
 ;                     (superpose (
 ;                             (remove-atom $bindspace (BindingOf Y $w)) (add-reduct $bindspace (BindingOf Y $w))
 ;                             (remove-atom $bindspace (BindingOf X $z)) (add-reduct $bindspace (BindingOf X $z))))))
 ;             (match $dbspace ($link $x $y)
 ;                 (superpose ( (remove-atom $bindspace (BindingOf Y $y)) (add-reduct $bindspace (BindingOf Y $y)))))
 ;         )))
 ; )

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

 ; (= (binding-set $link $x $y $dbspace $bindspace $depth) (
 ;         match $dbspace ($link $x $y) (
 ;             if (== $depth 0)
 ;             (superpose (
 ;                     (superpose ((remove-atom $bindspace (BindingOf z $x)) (add-atom $bindspace (BindingOf z $x))))
 ;                     (superpose ((remove-atom $bindspace (BindingOf (s z) $y)) (add-atom $bindspace (BindingOf (s z) $y))))
 ;                 )
 ;         )
 ;     (if (and (== (get-metatype $x) Symbol) (== (get-metatype $y) Expression))
 ;         (superpose (
 ;                 (superpose ((remove-atom $bindspace (BindingOf z $x)) (add-atom $bindspace (BindingOf z $x))))
 ;                 (let ($link1 $s $t) $y (
 ;                         superpose (
 ;                             (superpose ((remove-atom $bindspace (BindingOf (s z) $s)) (add-atom $bindspace (BindingOf (s z) $s))))
 ;                             (superpose ((remove-atom $bindspace (BindingOf (s (s z)) $t)) (add-atom $bindspace (BindingOf (s (s z)) $t))))
 ;                         )
 ;                 ))
 ;     ))
 ; (if (and (== (get-metatype $x) Expression) (== (get-metatype $y) Symbol))
 ;     (superpose (
 ;             (let ($link1 $s $t) $x (
 ;                     superpose (
 ;                         (superpose ((remove-atom $bindspace (BindingOf z $s)) (add-atom $bindspace (BindingOf z $s))))
 ;                         (superpose ((remove-atom $bindspace (BindingOf (s z) $t)) (add-atom $bindspace (BindingOf (s z) $t))))
 ;                     )
 ;             ))
 ;     (superpose ((remove-atom $bindspace (BindingOf (s (s z)) $y)) (add-atom $bindspace (BindingOf (s (s z)) $y))))
 ; ))
 ; Empty
 ; )
 ; )

 ; )
 ; )
 ; )

 ;  ;!(binding-set Inheritance $X $Y &dbspace &bindspace 0)
 ;  ;!(match &bindspace $h $h)