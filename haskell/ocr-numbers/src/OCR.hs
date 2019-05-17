module OCR (convert) where

import Data.List (transpose, intercalate)
import Data.List.Split (chunksOf)
import Data.Map (fromList, findWithDefault, Map)

rowToGlyphs :: [String] -> [[String]]
rowToGlyphs = transpose . map (chunksOf 3)

-- NOTE: this can be easily extended!
dictionary :: Map [String] Char
dictionary = fromList $ zip glyphsAlphabet digitsAlphabet
  where
    digitsAlphabet = "0123456789"
    glyphsAlphabet = rowToGlyphs
      [ " _     _  _     _  _  _  _  _ "
      , "| |  | _| _||_||_ |_   ||_||_|"
      , "|_|  ||_  _|  | _||_|  ||_| _|"
      , "                              "
      ]

convert :: String -> String
convert = intercalate "," . map convertRow . chunksOf 4 . lines
  where
    convertRow = map glyphToDigit . rowToGlyphs
    glyphToDigit glyph = findWithDefault '?' glyph dictionary
