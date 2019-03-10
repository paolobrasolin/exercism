module WordCount (wordCount) where

import Data.Char (
  isAlphaNum,
  toLower)

import Data.List

wordCount :: String -> [(String, Int)]
wordCount = splitAndCount . normalize
  where
    normalize = (map nonWordCharToSpace) . (map toLower) . dropQuotations
    dropQuotations [] = []
    dropQuotations (' ':'\'':cs) = ' ':(dropQuotations cs)
    dropQuotations ('\'':' ':cs) = ' ':(dropQuotations cs)
    dropQuotations (c:cs) = c:(dropQuotations cs)
    nonWordCharToSpace c = if (isAlphaNum c || c == '\'') then c else ' '
    splitAndCount = groupsToCounts . group . sort . words
    groupsToCounts = map (\g -> (head g, length g))
