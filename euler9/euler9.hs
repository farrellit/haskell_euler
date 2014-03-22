
pytrips=  [ (a,b,c) | c<-[1..1000],b<-[1..c], a<-[1..b], ((a^2)+(b^2))==(c^2) ]
pytrips1000 =  head [ (a,b,c) | (a,b,c) <- pytrips, (a + b + c) == 1000 ]

triprod (a,b,c) = a * b * c

pe9  = triprod pytrips1000

main = putStrLn( show pe9 )
