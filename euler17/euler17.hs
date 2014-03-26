
oneword 0 = ""
oneword 1 = "one"
oneword 2 = "two"
oneword 3 = "three"
oneword 4 = "four"
oneword 5 = "five"
oneword 6 = "six"
oneword 7 = "seven"
oneword 8 = "eight"
oneword 9 = "nine"

oneword 10 = "ten"
oneword 11 = "eleven"
oneword 12 = "twelve"
oneword 13 = "thirteen"
oneword 14 = "fourteen"
oneword 15 = "fifteen"
oneword 16 = "sixteen"
oneword 17 = "seventeen"
oneword 18 = "eighteen"
oneword 19 = "nineteen"

tenword 0 = ""
tenword 2 = "twenty"
tenword 3 = "thirty"
tenword 4 = "forty"
tenword 5 = "fifty"
tenword 6 = "sixty"
tenword 7 = "seventy"
tenword 8 = "eighty"
tenword 9 = "ninety"

wordpart word part 
	| wordl > 0 = word  ++ part
	| otherwise = ""
	where wordl = length word

letters s 
	| s >= 1000 = wordpart ( oneword (s `quot` 1000) ) "thousand" ++ ( letters hundreds )
	| s >= 100 	= wordpart (oneword  ( s `quot` 100) ) "hundred"  ++ ands ++ ( letters tens )
	| s >= 20 	= tenword ( s `quot` 10 ) ++ ( letters ones )
	| otherwise = oneword s
	where hundreds = s `mod` 1000
	      tens     = s `mod` 100
	      ones     = s `mod` 10
	      ands 		= if tens > 0 then "and" else ""

pe17 = length ( concat( [ letters s | s <- [ 1..1000 ] ] ) )

main = putStrLn ( show pe17) 
