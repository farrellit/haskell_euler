import Data.List
palindromic num = take half str == take half ( reverse str ) 
	where str  = show num 
	      half = quot ( length str ) 2

main = putStrLn ( show ( maximum $ [ (j*k ,j,k ) | j <- [19999,19998..10000], k <- [19999,19998..j], palindromic ( j * k ) ]  ) )
