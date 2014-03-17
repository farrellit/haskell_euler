

-- helper to find int sqrt
int_sqrt :: Integer -> Integer
int_sqrt x = floor ( sqrt ( fromIntegral x ) )

-- Test whether a number is prime, given a list of primes against which to compare
real_isprime :: Integer -> Integer -> [ Integer ] -> Bool
real_isprime x lim []  = True
real_isprime x lim (p:primes)
    -- check can stop when we pass sqrt ( would have already found lowest factor)
    | p > lim = True 
    -- primes cannot be divisible by anything else
    -- check should skip 1
    | p > 1 && x `mod` p == 0 = False 
    -- check next prime
    | otherwise = real_isprime x lim ( primes )
    -- where p = last primes

-- convenience function to plug in sqrt to real_isprime
isprime :: Integer -> [ Integer ] -> Bool
isprime x primes = real_isprime x ( int_sqrt x ) primes

-- Provide the next prime candidate given a last prime
nextprime_candidate :: Integer -> Integer 
nextprime_candidate lastprime 
    -- 0,1,2 next prime is one more 
    | lastprime < 3 = lastprime + 1
    -- all else it's next odd number
    | otherwise = lastprime + 2

-- Given a list of primes and the current candidate 
nextprime :: [ Integer ] -> Integer -> Integer
nextprime [] _ = 1
-- can't think of a cleaner way to start the search 
nextprime primes 0 = nextprime primes ( nextprime_candidate ( last ( primes ) ) )
-- recursively search for the next prime
nextprime primes candid 
    | isprime candid primes = candid 
    | otherwise = nextprime primes ( nextprime_candidate candid ) 

--- append the next prime onto the list 
appendprime :: [ Integer ] -> [ Integer ]
appendprime primes = primes ++  [ ( nextprime primes 0 ) ]

-- find primes until the largest is larger than the given limit
findprimes_thru :: Integer -> [ Integer ] -> [ Integer ]
findprimes_thru limit seed 
    | length seed == 0 || last seed < limit = findprimes_thru limit ( appendprime seed )
    | otherwise = seed 

-- find the largest prime factor of num
-- largest_prime_factor :: Integer -> [ Integer ] -> Integer
-- largest_prime_factor num primes 
--    | 

-- main = putStrLn ( show ( findprimes_thru ( floor (fromIntegral 600851475143 / 2) ) [] ) )
main = putStrLn ( show ( findprimes_thru 50000 [] ) )
