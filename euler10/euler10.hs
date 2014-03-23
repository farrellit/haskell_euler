
int_sqrt x = floor( sqrt ( fromIntegral x ) )

-- a bit faster because we fall out of the loop faster ( at the expense of elegance )
real_isprime num (c:cmp)
	| num == c = True
	| num `mod` c == 0 = False
	| null cmp = True
	| otherwise = ( real_isprime num cmp )

isprime2 num = ( real_isprime num (2:3:[5,7..(int_sqrt num ) ]) )

pe10 = sum ( [ x | x<-(2:[3,5..2000000]), isprime2 x ] )

main = putStrLn ( show pe10 )
