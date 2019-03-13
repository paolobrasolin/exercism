module Pangram (isPangram) where

import Data.Char (toUpper)

isPangram :: String -> Bool
isPangram text = upperText `covers` ['A'..'Z']
  where
    upperText = map toUpper text
    covers xs = all (`elem` xs)
