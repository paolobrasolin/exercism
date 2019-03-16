module Bob (responseFor) where

import Text.Regex.PCRE

responseFor :: String -> String
responseFor xs
  | isSilence = "Fine. Be that way!"
  | isYelling &&
    isInquiry = "Calm down, I know what I'm doing!"
  | isYelling = "Whoa, chill out!"
  | isInquiry = "Sure."
  | otherwise = "Whatever."
  where
    isSilence = xs =~ "\\A\\s*\\Z"
    isYelling = xs =~ "\\A\\P{Ll}+\\Z" && xs =~ "\\p{Lu}"
    isInquiry = xs =~ "\\?\\s*\\Z"
