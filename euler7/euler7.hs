
int_sqrt x = floor( sqrt ( fromIntegral x ) )

isprime 1 = True
isprime 2 = True
isprime 3 = True
isprime num = if length [ x | x <- (2:3:[5,7..(int_sqrt num ) ]), num `mod` x == 0 ] == 0 then True else False

-- a bit faster because we fall out of the loop faster ( at the expense of elegance )
real_isprime num (c:cmp)
	| num == c = True
	| num `mod` c == 0 = False
	| null cmp = True
	| otherwise = ( real_isprime num cmp )

isprime2 num = ( real_isprime num (2:3:[5,7..(int_sqrt num ) ]) )

pe7 = last ( take 10001 [ x | x<-(2:[3,5..]), isprime2 x ] )

main = putStrLn ( show pe7 )
