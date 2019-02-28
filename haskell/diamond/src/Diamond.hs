module Diamond (diamond) where

import Data.Char (ord, chr)

diamond :: Char -> Maybe [String]
diamond l = Just theFigure
  where
    theFigure = [[if onDiamond i j then theLetter i else ' ' | i <- [0..maxIndex]] | j <- [0..maxIndex]]
    theLetter i = chr $ ord 'A' + div (distance i) 2
    onDiamond i j = maxIndex == distance i + distance j
    maxIndex = 2 * (ord l - ord 'A')
    distance i = abs (maxIndex - 2 * i)
