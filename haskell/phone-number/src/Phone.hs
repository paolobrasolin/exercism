module Phone (number) where

import Data.Char (
  isNumber,
  digitToInt)

number :: String -> Maybe String
number input
  | length filtered == 10 && validShort = Just $ reverse filtered
  | length filtered == 11 && validLong = Just $ reverse $ take 10 filtered
  | otherwise = Nothing
  where
    filtered = reverse $ filter isNumber input
    validExchange = 1 < digitToInt (filtered !! 6)
    validArea = 1 < digitToInt (filtered !! 9)
    validCountry = '1' == filtered !! 10
    validShort = validArea && validExchange
    validLong = validCountry && validShort
