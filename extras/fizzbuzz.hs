
fizz x = if x `mod` 3 == 0 then "Fizz" else ""
buzz x = if x `mod` 5 == 0 then "Buzz" else ""
fizzbuzz_maybe x = fizz x ++ buzz x
fizzbuzz x = head [ z | z <- [ fizzbuzz_maybe x,  show x ] , length z > 0 ] 

main = putStrLn ( show [ fizzbuzz x | x <- [1..100] ] )
