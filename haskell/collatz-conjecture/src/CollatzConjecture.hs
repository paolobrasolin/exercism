module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ succToFix 0 collatzOp n

collatzOp :: (Integral a) => a -> a
collatzOp n
  | 1 == n = 1
  | odd n = 3 * n + 1
  | otherwise = div n 2

succToFix :: (Enum i, Eq b) => i -> (b -> b) -> b -> i
succToFix i f x
  | f x == x = i
  | otherwise = succToFix (succ i) f (f x)
