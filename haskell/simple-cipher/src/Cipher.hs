module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where

import Data.Char (ord, chr)
import System.Random (newStdGen, randomRs)

zipAsOrdWith :: (Int -> Int -> Int) -> String -> String -> String
zipAsOrdWith f = zipWith (\x y -> chr' $ f (ord' x) (ord' y))
  where ord' c = ord c - ord 'a'
        chr' n = chr $ ord 'a' + mod n 26

caesarDecode :: String -> String -> String
caesarDecode key msg = zipAsOrdWith (-) msg (cycle key)

caesarEncode :: String -> String -> String
caesarEncode key msg = zipAsOrdWith (+) msg (cycle key)

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom msg = do
  generator <- newStdGen
  let key = take (length msg) (randomRs ('a', 'z') generator)
  return (key, caesarEncode key msg)
