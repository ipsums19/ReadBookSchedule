
; descripcion de lproblema

( define (problem lecturas)
	(:domain libros)
	(:objects
		l1 l2 l3 l4 l5 - book
		enero febrero marzo abril - month
	)

	(:init
		;(par l2 l4) (par l5 l4) (par l3 l5) ;(par l1 l3)
		;(par l1 l4) (par l2 l4) (par l4 l5) (par l5 l3)
		;(pre l1 l2) (pre l2 l3) 

		;(par l1 l2) (par l1 l3) (par l1 l4) (par l1 l5)
		;(par l2 l3) (par l2 l4) (par l2 l5)
		;(par l3 l4) (par l3 l5) (par l4 l5)

		(= (pages l1) 300) (= (pages l2) 300) (= (pages l3) 300) (= (pages l4) 300) (= (pages l5) 300) 

		(= (month l1) 0) (= (month l2) 0) (= (month l3) 0) (= (month l4) 0) (= (month l5) 0)

		(= (mpages enero) 0)  (= (mpages febrero) 0)  (= (mpages marzo) 0)  (= (mpages abril) 0)
		
		(= (value enero) 1) (= (value febrero) 2) (= (value marzo) 3) (= (value abril) 4)



		(= (current-month) 1)
       (= (max-pages-month) 800)

	)

	(:goal
		(forall (?l - book) (read ?l))
	)


)
