module Bob (responseFor) where

import Data.Char (isUpper, isLetter, isSpace)

responseFor :: String -> String
responseFor xs
  | isSilence = "Fine. Be that way!"
  | isYelling && 
    isInquiry = "Calm down, I know what I'm doing!"
  | isYelling = "Whoa, chill out!"
  | isInquiry = "Sure."
  | otherwise = "Whatever."
  where
    compact = filter (not.isSpace) xs
    letters = filter isLetter compact
    isSilence = null compact
    isYelling = not (null letters) && all isUpper letters
    isInquiry = last compact == '?'
