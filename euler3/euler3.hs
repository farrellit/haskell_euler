
int_sqrt x = floor( sqrt ( fromIntegral x ) )

isprime 1 = True
isprime 2 = True
isprime 3 = True
isprime num = if length [ x | x <- (2:3:[5,7..(int_sqrt num ) ]), num `mod` x == 0 ] == 0 then True else False

-- largest_factors :: Integer -> [ Integer ]
largest_factors num = [ quot num x | x <- [23..(int_sqrt num ) ] , num `mod` x == 0 ]
factors num = [ quot num x | x <- lf ] ++ lf where lf = ( largest_factors num )
prime_factors num = [ x | x <- ( factors num ) , isprime x ]

largest_prime_factor num = maximum ( prime_factors num )

main = putStrLn ( show ( largest_prime_factor 600851475143 ) )
