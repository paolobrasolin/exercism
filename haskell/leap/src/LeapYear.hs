module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divBy 4 && ((not.divBy) 100 || divBy 400)
  where divBy n = 0 == rem year n
