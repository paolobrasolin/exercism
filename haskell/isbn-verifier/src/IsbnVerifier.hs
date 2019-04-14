module IsbnVerifier (isbn) where

import Data.Char (isAlphaNum, digitToInt)
import Text.Regex.PCRE

validateFormat :: String -> Maybe String
validateFormat code
  | code =~ wide_format = Just code
  | code =~ thin_format = Just code
  | otherwise = Nothing
  where
    wide_format = "\\A\\d-?\\d{3}-?\\d{5}-?(\\d|X)\\Z"
    thin_format = "\\A\\d{9}(\\d|X)\\Z"

checkSum :: [Int] -> Bool
checkSum values = sum (zipWith (*) [10,9..] values) `mod` 11 == 0

stringToValues :: String -> [Int]
stringToValues = map charToValue . filter isAlphaNum
  where
    charToValue 'X' = 10
    charToValue n = digitToInt n

isbn :: String -> Bool
isbn = maybe False checkSum . fmap stringToValues . validateFormat

