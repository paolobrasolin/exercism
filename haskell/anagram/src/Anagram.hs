module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toUpper)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = [ys | ys <- xss, isAnagram ys]
  where
    isAnagram zs = upcase xs /= upcase zs && normal xs == normal zs
    upcase = map toUpper
    normal = sort.upcase
