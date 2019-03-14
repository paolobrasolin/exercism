module ResistorColors (Color(..), value) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Read, Enum)

value :: [Color] -> Int
value = sum . zipWith evaluateBand [0..] . reverse
  where
    evaluateBand index color = 10 ^ index * fromEnum color
