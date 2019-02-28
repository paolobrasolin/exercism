module CryptoSquare (encode) where

import Data.Char (
  isAlphaNum, 
  toLower)

encode :: String -> String
encode xs
  | l <= 1 = normalized
  | otherwise = encoded
  where
    normalized = [toLower x | x <- xs, isAlphaNum x]
    l = length normalized
    c = ceiling.sqrt.fromIntegral $ l
    r = ceiling $ (fromIntegral l) / (fromIntegral c)
    padded = normalized ++ replicate (r * c - l + c) ' '
    encoded = [padded !! (i + j * c) | i <- [0..c-1], j <- [0..r]]
