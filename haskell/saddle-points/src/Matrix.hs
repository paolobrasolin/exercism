module Matrix (saddlePoints) where

import Data.Array

saddlePoints :: (Ix i, Ix j, Ord e) => Array (i, j) e -> [(i, j)]
saddlePoints matrix = map fst $ filter isSaddlePoint $ assocs matrix
  where
    isSaddlePoint ((i,j),v) = v == colMin j && v == rowMax i
    ((minRow, minCol), (maxRow, maxCol)) = bounds matrix
    rowMax i = maximum $ map (matrix !) $ range ((i, minCol), (i, maxCol))
    colMin j = minimum $ map (matrix !) $ range ((minRow, j), (maxRow, j))
