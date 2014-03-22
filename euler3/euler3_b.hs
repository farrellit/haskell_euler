
int_sqrt x = floor( sqrt ( fromIntegral x ) )

isprime 1 = True
isprime 2 = True
isprime 3 = True
isprime num = if length [ x | x <- (2:3:[5,7..(int_sqrt num ) ]), num `mod` x == 0 ] == 0 then True else False

largest_prime_factor :: Integer -> Integer
largest_prime_factor num = head [ num `quot` x | x <- [2..], ( num `mod` x == 0 ) && ( isprime ( num `quot` x ) )]

main = putStrLn ( show ( largest_prime_factor 600851475143  ))

