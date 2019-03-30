module Beer (song) where

import Text.Printf (printf)
import Data.Char (toUpper)
import Data.List (intersperse)

bobs_count :: Int -> String
bobs_count 0 = "no more bottles of beer"
bobs_count 1 = "1 bottle of beer"
bobs_count n = printf "%d bottles of beer" n

wall_count :: Int -> String
wall_count n = printf "%s on the wall" (bobs_count n)

action :: Int -> String
action 0 = "go to the store and buy some more"
action n = printf "take %s down and pass it around" 
                  (if n == 1 then "it" else "one")

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = (toUpper x):xs

verse :: Int -> String
verse n = printf "%s, %s.\n%s, %s.\n"
                 (capitalize $ wall_count n)
                 (bobs_count n)
                 (capitalize $ action n)
                 (wall_count $ mod (n - 1) 100)

song :: String
song = concat $ intersperse "\n" $ map verse $ reverse [0..99]
