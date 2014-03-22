
pe6_diff ls = ( ( sum [ x | x <- ls ] ^ 2 ) - ( sum [ x^2 | x <- ls ] ) )

main = putStrLn( show ( pe6_diff [1..100] ) )
