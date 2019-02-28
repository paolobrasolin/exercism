module Acronym (abbreviate) where

import Data.Char (
  isAlpha, 
  isLower, 
  isUpper, 
  toUpper, 
  generalCategory,
  GeneralCategory(
    Space, 
    ModifierLetter,
    DashPunctuation)
  )

abbreviate :: String -> String
abbreviate [] = ""
abbreviate cs@(c:_) = map toUpper $ accumulateInitials [c] cs
  where
    accumulateInitials initials (a:z:zs)
      | isCamelHump a z || 
        isDelimited a z = accumulateInitials (initials ++ [z]) zs
      | otherwise = accumulateInitials initials (z:zs)
    accumulateInitials initials _ = initials
    isCamelHump a z = isLower a && isUpper z -- like "aZ"
    isDelimited a z = isDelim a && isAlpha z -- like " a", "'s" or "-m"
    isDelim char =
      case generalCategory char of
        Space           -> True -- like " "
        ModifierLetter  -> True -- like "'"
        DashPunctuation -> True -- like "-"
        _               -> False
