module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divBy 4 && (divBy 400 || (not.divBy) 100)
  where divBy n = 0 == mod year n
