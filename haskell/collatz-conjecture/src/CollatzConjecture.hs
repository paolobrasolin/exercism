module CollatzConjecture (collatz) where

import Data.List (elemIndex)

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = fmap toInteger $ elemIndex 1 $ iterate collatzOp n

collatzOp :: (Integral a) => a -> a
collatzOp n
  | 1 == n = 1
  | odd n = 3 * n + 1
  | otherwise = quot n 2
