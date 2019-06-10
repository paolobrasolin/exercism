module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts cs = fillFrequencyTable <$> traverse toNucleotide cs
  where fillFrequencyTable = foldr (adjust (+1)) voidFrequencyTable
        voidFrequencyTable = fromList $ zip [A, C, G, T] [0, 0..]

toNucleotide :: Char -> Either String Nucleotide
toNucleotide c = case c of
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  _   -> Left $ "Invalid nucleotide found: " ++ [c]
