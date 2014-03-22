isprime 1 = True
isprime 2 = True
isprime num = if length [ x | x <- (2:3:[5,7..(int_sqrt num ) ]), num `mod` x == 0 ] == 0 then True else False

intdiv :: Integer -> Integer -> Integer 
intdiv a b = floor( ( fromIntegral a ) / ( fromIntegral b ) )  

largest_factors :: Integer -> [ Integer ]
largest_factors num = [ intdiv num x | x <- [2,3..(int_sqrt num ) ] , num `mod` x == 0 ]

factors num = [ intdiv num x | x <- lf ] ++ lf where lf = ( largest_factors num )

prime_factors num = [ x | x <- ( factors num ) , isprime x ]

-- largest_prime_factor num = max (prime_factors num )
