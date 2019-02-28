module Isogram (isIsogram) where

import Data.Char (toUpper, isAlpha)
import Data.List (sort, group)

isIsogram :: String -> Bool
isIsogram = all (==1) . countOccurrences . normalize
  where
    normalize = map toUpper . filter isAlpha
    countOccurrences = map length . group . sort
