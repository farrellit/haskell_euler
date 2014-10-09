
-- method:
-- let 1 be monday and 0 be sunday.  Thus, Jan 1 1900 was day '1'.

-- track offset through the months through the years.
-- if offset is 0, the month starts on a sunday.

days_in_month :: [ Integer ]
days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

is_leap_yr yr
    | is_century = ( mod yr 400 == 0 )
    | otherwise  = ( mod yr 4   == 0 )
    where is_century = ( mod yr 100 == 0 )

days_before_yr_mo :: Integer -> Int -> Integer
days_before_yr_mo _ 1 = 0  -- always 0 days before january
days_before_yr_mo yr mo  
    | is_leap_yr yr && ( mo > 2 ) = daysum + 1
    | otherwise = daysum
    where realmo = mo - 1 
          daysum = sum (take realmo days_in_month)

year_offset yr = mod ( quot ( yr - 1900 ) 4 + ( yr - 1900 ) ) 7

startday_yr_mo :: Integer -> Int -> Integer -> Integer
startday_yr_mo yr mo yr_offset = (days_before_yr_mo yr mo + yr_offset + 1 ) `mod` 7

sundays_in_year yrs = sum [ 1 | d <- [ startday_yr_mo yr x offset | x <- [1..12], yr <- yrs, offset <- [ year_offset yr ] ], d == 0 ]
