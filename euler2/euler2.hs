pe2_fib all@(n2:n1:ns) = if (n2+n1)<=4000000 then pe2_fib ((n2+n1):n2:n1:ns) else all
main = putStrLn ( show ( sum [ x | x <- pe2_fib [ 2, 1], x `mod ` 2 == 0 ] ) )
