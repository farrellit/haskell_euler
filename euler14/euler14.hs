
-- going to deal with these collatz lists in reverse
--
next_collatz :: Integer -> Integer 
next_collatz n 
	| n `mod` 2 == 0 = n `quot` 2
	| otherwise = 3 * n + 1

collatz :: [ Integer ] -> [ Integer ]
collatz (n:ns)
	| n == 1  = ( n:ns )
	| otherwise = collatz( (next_collatz n):n:ns )

collatz_length n = length ( collatz [ n ] )

collatz_max_length lim = maximum [ ( l, n ) | n <- [1..(lim-1)], l <- [ collatz_length n ] ] 

pe14 = collatz_max_length 1000000

main = putStrLn ( show pe14 ) 
