module Triangle (TriangleType(..), triangleType) where

import Data.List

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Eq a, Ord a) => a -> a -> a -> TriangleType
triangleType 0 0 0 = Illegal
triangleType a b c
  | any (<= 0) sides = Illegal
  | x + y < z = Illegal
  | x == y && y == z = Equilateral
  | x == y || y == z = Isosceles
  | otherwise = Scalene
  where sides@(x:y:z:[]) = sort [a, b, c]
