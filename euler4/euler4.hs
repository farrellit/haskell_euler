import Data.List
palindromic num = take half str == take half ( reverse str ) 
	where str  = show num 
	      half = quot ( length str ) 2

main = putStrLn ( show ( maximum [ j*k | j <- [100..999], k <- [100..999], palindromic ( j * k ) ]  ) )
