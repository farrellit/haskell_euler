
-- pascal's triangle can answer euler # 15 quickly.
-- not as fast as "2n take n", but pretty fast

-- generate level n of pasal's triangle

ptri :: Integer -> [ Integer ]
ptri 0 = []
ptri 1 = [1]
ptri x =  psums (  0:(ptri (x -1))++[0]  )

psums :: [ Integer ] -> [ Integer ]
psums [] = []
psums [0] = []
psums [n] = psums (0:[n])
psums (x:y:xs) = ( x + y ):(psums (y:xs))

middle :: [ a ] -> a 
middle as = as !! ( length as `quot` 2 )

lattice_paths n = middle ( ptri ( 2 * n + 1 ) )

main = putStrLn ( show ( lattice_paths 20 ))
