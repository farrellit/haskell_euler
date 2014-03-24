
lattice_paths 0 0 = 0
lattice_paths h 0 = 1 -- can only go down
lattice_paths 0 w = 1 -- can only go across 
lattice_paths h w 
	| h == w = 2 * ( lattice_paths (h-1) w ) -- same on both sides
	| otherwise = ( lattice_paths (h-1 ) w ) + ( lattice_paths h ( w-1 )  )

-- too slow!

-- main = putStrLn( show ( lattice_paths 20 20 ) ) 

-- hmmm, seems like this is a factoral thing.

factorial 0 = 1
factorial 1 = 1 
factorial n = n * factorial ( n-1)

lp2 0 = 0
lp2 1 = 2
lp2 x = ( factorial ( 2 * x ) ) `quot` ( factorial x ^ 2 ) 

main = putStrLn( show ( lp2 20 ) ) 
