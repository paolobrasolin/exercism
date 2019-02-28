module Minesweeper (annotate) where

import Data.Char (intToDigit)

annotate :: [String] -> [String]
annotate board = [[annot i j | j <- [0..c-1]] | i <- [0..r-1]]
  where
    range i l = [max 0 (i-1)..min (l-1) (i+1)]
    minor i j = [(k,l) | k <- range i r, l <- range j c]
    count i j = length $ filter (== '*') [board !! k !! l | (k,l) <- minor i j]
    annot i j
      | board !! i !! j == '*' = '*'
      | count i j == 0 = ' '
      | otherwise = intToDigit $ count i j
    r = length board
    c = length $ head board
