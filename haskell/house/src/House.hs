module House (rhyme) where

import Data.List (intercalate)

stuff :: [(String, String)]
stuff = [
  (undefined, "the horse and the hound and the horn"),
  ("belonged to", "the farmer sowing his corn"),
  ("kept", "the rooster that crowed in the morn"),
  ("woke", "the priest all shaven and shorn"),
  ("married", "the man all tattered and torn"),
  ("kissed", "the maiden all forlorn"),
  ("milked", "the cow with the crumpled horn"),
  ("tossed", "the dog"),
  ("worried", "the cat"),
  ("killed", "the rat"),
  ("ate", "the malt"),
  ("lay in", "the house that Jack built.")]

verse :: Int -> String
verse n = unlines verseLines
  where
    verseLines = this (head list) : map (that) (tail list)
    list = drop (length stuff - n) stuff
    this (_,z) = "This is " ++ z
    that (a,z) = "that " ++ a ++ " " ++ z

rhyme :: String
rhyme = intercalate "\n" $ map verse [1..12]
