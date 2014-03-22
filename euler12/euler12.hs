
import Data.List

int_sqrt x = floor( sqrt ( fromIntegral x ) )

largest_factors num = [ quot num x | x <- [2,3..(int_sqrt num ) ] , num `mod` x == 0 ]

factors num = sort ( 1:num:[ quot num x | x <- lf ] `union` lf ) where lf = ( largest_factors num ) 

pe12 = head [ sum [1..x] | x <- [1..], length( factors ( sum [1..x] ) ) > 500 ]

main = putStrLn ( show pe12 ) 
