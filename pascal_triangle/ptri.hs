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
