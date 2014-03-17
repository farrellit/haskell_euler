ghci <<-EOF
:load "primegen.hs"

"int_sqrt"
if int_sqrt 1 /= 1  then error "int_sqrt failure: int_sqrt  1 should == 1" else "success"
if int_sqrt 15 /= 3 then error "int_sqrt failure: int_sqrt 15 should == 3" else "success"
if int_sqrt 25 /= 5 then error "int_sqrt failure: int_sqrt 25 should == 5" else "success"

let primes =  [ 7,5,3,2,1 ] 

"isprime" 
if isprime 2 primes      then "success" else error "isprime  2 should be true"
if isprime 11 primes     then "success" else error "isprime 11 should be true"
if not(isprime 12 primes)then "success" else error "isprime 12 should be false"

"nextprime_candidate" 
if nextprime_candidate 0 /= 1 then error "nextprime_candidate 0 should == 1" else "success"
if nextprime_candidate 3 /= 5 then error "nextprime_candidate 3 should == 5" else "success"

"nextprime"
if nextprime [] 0 /= 1 then error "nextprime [] 0 should == 1" else "success"
if nextprime primes 0 /= 11 then error ( "nextprime " ++ ( show primes ) ++ " 0 should == 11, got " ++ ( show ( nextprime primes 0 ) ) ) else "success"

"prependprime" 
if prependprime primes == 11:primes then "success" else "prependprimes " ++ ( show primes ) ++ " should be " ++ ( show ( 11:primes ) ) ++ " but gave " ++ ( show ( prependprime primes ) )

"findprimes_thru"
if findprimes_thru 11 [] == 11:primes then "success" else error "findprimes_thru 11 [] should have given us " ++ ( show (11:primes) ) ++ " but we got " ++ ( show ( findprimes_thru 11 [] ) ) 

EOF
