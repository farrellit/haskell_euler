
even_div_either num mod1 mod2 = if num `mod` mod1 == 0 then num else if num `mod` mod2 == 0 then num else 0 

euler1 num = if num > 2 then ( even_div_either num 3 5 ) + (euler1 (num-1)) else 0

main = print ( euler1 (1000 - 1 ) )
