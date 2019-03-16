{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isSpace, isLetter, isUpper)
import qualified Data.Text as T

responseFor :: T.Text -> T.Text
responseFor xs
  | isSilence = "Fine. Be that way!"
  | isYelling &&
    isInquiry = "Calm down, I know what I'm doing!"
  | isYelling = "Whoa, chill out!"
  | isInquiry = "Sure."
  | otherwise = "Whatever."
  where
    compact = T.filter (not.isSpace) xs
    letters = T.filter isLetter compact
    isSilence = T.null compact
    isYelling = not (T.null letters) && T.all isUpper letters
    isInquiry = T.last compact == '?'
