module RunLength (decode, encode) where

import Data.Char (isDigit)
import Data.List (group)

decode :: String -> String
decode "" = ""
decode encodedText = decodedFragment ++ decode encodedRemainder
  where
    repsAndCharRest = span isDigit encodedText
    repsAndChar = (stringToInt, head) `mapPair` repsAndCharRest
    encodedRemainder = tail $ snd repsAndCharRest
    decodedFragment = uncurry replicate repsAndChar
    mapPair (f,g) (a,b) = (f a, g b)
    stringToInt ds
      | null ds = 1
      | otherwise = read ds :: Int

encode :: String -> String
encode text = concatMap encodeStreak $ group text
  where
    encodeStreak x = encodeLength x ++ [head x]
    encodeLength x
      | length x == 1 = ""
      | otherwise = show $ length x
