module Change (findFewestCoins) where

import Data.List (minimumBy)
import Data.Ord (comparing)
import Safe.Foldable (minimumByMay)

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins
  | target < 0 = Nothing
  | otherwise = optimalSolutions !! fromIntegral target
  where
    optimalSolutions = Just [] : [minimumByMay (comparing length) (allowedSolutions target) | target <- [1..]]
    allowedSolutions target = [coin:reducedSolution | coin <- filter (<= target) coins,
      Just reducedSolution <- [optimalSolutions !! fromIntegral (target - coin)]]
