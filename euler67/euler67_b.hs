import System.Random

maxrowsum row2 row1 = [sum1 `max` sum2|x<-[0..(length row1-1)],sum1<-[row1!!x+(row2!!x)],sum2<-[row1!!x+(row2!!(x+1))] ]

maxsum [x] = head x 
maxsum (p2:p1:ps) =maxsum ((maxrowsum p2 p1):ps)

pe18sum inp = maxsum ( inp )

pe18sum [  take n  [ floor (100 * x)  | x <- ( randoms (mkStdGen 11) :: [Float] ) ] | n <- [1000..1] ]
