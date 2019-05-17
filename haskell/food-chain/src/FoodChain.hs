module FoodChain (song) where

import Data.List (intercalate)

stuff :: [(String, String)]
stuff =
  [ ("fly", undefined)
  , ("spider that wriggled and jiggled and tickled inside her", "It wriggled and jiggled and tickled inside her.")
  , ("bird", "How absurd to swallow a bird!")
  , ("cat", "Imagine that, to swallow a cat!")
  , ("dog", "What a hog, to swallow a dog!")
  , ("goat", "Just opened her throat and swallowed a goat!")
  , ("cow", "I don't know how she swallowed a cow!")
  , ("horse", "She's dead, of course!")
  ]

longName :: Int -> String
longName n = fst $ stuff !! n

shortName :: Int -> String
shortName = head . words . longName

iKnow :: Int -> String
iKnow n = "I know an old lady who swallowed a " ++ shortName n ++ ".\n"

dunno:: String
dunno = "I don't know why she swallowed the fly. Perhaps she'll die.\n"

amaze :: Int -> String
amaze n = snd (stuff !! n) ++ "\n"

eatIt :: Int -> String
eatIt n = "She swallowed the " ++ shortName n ++ " to catch the " ++ longName (n - 1) ++ ".\n"

verse :: Int -> String
verse n = case n of
  0 -> iKnow n ++ dunno
  7 -> iKnow n ++ amaze n
  _ -> concat [iKnow n, amaze n, concatMap eatIt [n,n-1..1], dunno]

song :: String
song = intercalate "\n" $ map verse [0..7]
