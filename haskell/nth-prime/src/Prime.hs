module Prime (nth) where

isDivisorOf :: (Integral a) => a -> a -> Bool
isDivisorOf n d = mod n d == 0 

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime n = not $ any (isDivisorOf n) smallDivisors
  where
    smallDivisors = takeWhile (<= sqrtOf n) allPrimes
    sqrtOf = floor.sqrt.fromInteger

allPrimes :: [Integer]
allPrimes = [n | n <- [2..], isPrime n]

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ allPrimes !! (n - 1)
