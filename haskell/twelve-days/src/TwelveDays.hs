module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop = [nthDay $ n - 1 | n <- [start..stop]]

nthDay :: Int -> String
nthDay n = intro ++ toSentence [gifts !! i | i <- reverse [0..n]]
  where
    intro = "On the " ++ ordinals !! n ++ " day of Christmas my true love gave to me: "

toSentence :: [String] -> String
toSentence [] = ""
toSentence (x:[]) = x
toSentence (x:y:[]) = x ++ ", and " ++ y
toSentence (x:xs) = x ++ ", " ++ toSentence xs

ordinals :: [String]
ordinals = [
  "first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

gifts :: [String]
gifts = [
  "a Partridge in a Pear Tree.", "two Turtle Doves", "three French Hens",
  "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
  "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
  "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]
