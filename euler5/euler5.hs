import Data.List

int_sqrt x = floor( sqrt( fromIntegral x ) )

largest_factors num = [ quot num x | x <- [2..(int_sqrt num ) ] , num `mod` x == 0 ]
factors num = 1:num:[ quot num x | x <- lf ] `union` lf  -- sqrt will be duplicated if not avoided
	where lf = ( largest_factors num )
smallest_factor_in l = head [ x | x <- [ lmax,(2*lmax)..], sort ( factors x `intersect` l  ) == sort l ]  
	where lmax = maximum l
-- main = putStrLn ( show ( smallest_factor_in [20,19..2] ) ) 

