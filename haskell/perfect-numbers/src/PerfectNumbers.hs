module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0          = Nothing
  | aliquotSum < n  = Just Deficient
  | aliquotSum == n = Just Perfect
  | aliquotSum > n  = Just Abundant
  where
    aliquotSum = sum factors
    factors = [d | d <- [1..n-1], mod n d == 0]
