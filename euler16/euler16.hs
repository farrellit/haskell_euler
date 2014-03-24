
read' :: Char -> Int
read' c = read (c:[])
pe16 = sum [ read' x | x <- show (2 ^ 1000) ] 
main = putStrLn ( show pe16 )
