
    ; descripcion del dominio

    ( define (domain libros)
    (:requirements :adl :fluents)
    (:types book month)
    (:predicates
        (read ?x - book)
        (pre ?x - book ?y - book)
        (par ?x - book ?y - book)

        (dep ?x - book)
    )
    (:functions
        (value ?m - month)
        (month ?x - book)
        (current-month)

        (pages ?l - book)
        (mpages ?m - month)
        (max-pages-month)
    )

    (:action readbook
        :parameters (?x - book ?m - month)
        :precondition 	(and (not (read ?x)) (= (value ?m) (current-month))
                            (<= (+ (mpages ?m) (pages ?x)) (max-pages-month))

                            (not (exists (?y - book)
                                        (and (pre ?y ?x)
                                            (or (not (read ?y))
                                                (and (read ?y)
                                                    (>= (month ?y) (value ?m)))))))

                            (or (not (exists (?y - book) (dep ?y)))
                                (and (dep ?x)
                                    (not (exists (?y - book)
                                        (and (read ?y)
                                            (or (par ?x ?y) (par ?y ?x))
                                            (or (> (month ?y) (+ (current-month) 1))
                                                (< (month ?y) (- (current-month) 1))))))))
                        )

        :effect (and (read ?x) (not (dep ?x))
                    (increase (month ?x) (current-month))
                    (increase (mpages ?m) (pages ?x))
                    (forall (?y - book)
                        (when (and (not (read ?y)) (or (par ?x ?y) (par ?y ?x)))
                                (dep ?y)))
                )	
    )

    (:action nextmonth
        :parameters ()
        :precondition (< (current-month) 13)
        :effect (increase (current-month) 1)
    )

    )
