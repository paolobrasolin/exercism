module Luhn (isValid) where

import Data.Char(
  digitToInt,
  isNumber)

isValid :: String -> Bool
isValid n
  | length filtered < 2 = False
  | otherwise = mod checkSum 10 == 0
  where 
    filtered = filter isNumber $ n
    checkSum = snd $ foldl checkSummer (0,0) $ reverse $ map digitToInt $ filtered
    checkSummer (i, sum) d = (i + 1, sum + (doubleIfOdd i d))
    doubleIfOdd i d = if odd i then trimToDigit (2 * d) else d
    trimToDigit d = if d > 9 then d - 9 else d
