are_factors :: Integer -> [ Integer ] -> Bool
are_factors num (p:ps)  
	| null ps = ( num `mod` p == 0 )
	| ( num `mod` p /= 0) = False
	| otherwise = are_factors num ps 

pe5 = head [ x | x <- [20,40..], are_factors x [ 20,19..2] ]

main = putStrLn( show pe5 ) 
