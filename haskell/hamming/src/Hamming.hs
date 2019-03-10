module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ dist 0 xs ys
  where
    dist d [] [] = d
    dist d (a:as) (b:bs)
      | a /= b = dist (d+1) as bs
      | otherwise = dist d as bs
