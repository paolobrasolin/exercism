module Bob (responseFor) where

import Data.Char (isSpace, isLetter, isUpper)
import qualified Data.Text as T

responseFor :: T.Text -> T.Text
responseFor xs
  | isSilence = T.pack "Fine. Be that way!"
  | isYelling &&
    isInquiry = T.pack "Calm down, I know what I'm doing!"
  | isYelling = T.pack "Whoa, chill out!"
  | isInquiry = T.pack "Sure."
  | otherwise = T.pack "Whatever."
  where
    compact = T.filter (not.isSpace) xs
    letters = T.filter isLetter compact
    isSilence = T.null compact
    isYelling = not (T.null letters) && T.all isUpper letters
    isInquiry = T.last compact == '?'
