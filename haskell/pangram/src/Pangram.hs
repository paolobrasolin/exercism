module Pangram (isPangram) where


import Data.Char (toUpper)

isPangram :: String -> Bool
isPangram text = (map toUpper text) `covers` ['A'..'Z']
  where
    covers xs ys = all (\x -> elem x xs) ys
