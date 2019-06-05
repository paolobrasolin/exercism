module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , Matrix.fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.Vector (Vector, fromList, ifilter, backpermute)

data Matrix a = Matrix (Int, Int) (Vector a) deriving (Eq, Show)

cols :: Matrix a -> Int
cols (Matrix (_, c) _) = c

column :: Int -> Matrix a -> Vector a
column x (Matrix (r, c) es) = ifilter (\i _ -> rem i c == x) es

flatten :: Matrix a -> Vector a
flatten (Matrix _ es) = es

fromList :: [[a]] -> Matrix a
-- TODO: simplify fromList
fromList [] = Matrix (0, 0) (Data.Vector.fromList [])
fromList elements = fl elements
  where fl = Matrix (rows, cols) . Data.Vector.fromList . concat
        rows = length elements
        cols = length $ head elements

fromString :: Read a => String -> Matrix a
fromString = Matrix.fromList . map (map read) . map words . lines

reshape :: (Int, Int) -> Matrix a -> Matrix a
-- TODO: simplify check shape is compatible
reshape s (Matrix _ es) = Matrix s es

row :: Int -> Matrix a -> Vector a
row y (Matrix (r, c) es) = ifilter (\i _ -> quot i c == y) es

rows :: Matrix a -> Int
rows (Matrix (r, _) _) = r

shape :: Matrix a -> (Int, Int)
shape (Matrix s _) = s

transpose :: Matrix a -> Matrix a
transpose (Matrix (r, c) elements) = Matrix (c, r) (backpermute elements idcs)
  where idcs = Data.Vector.fromList [y * c + x | x <- [0..c-1], y <- [0..r-1]] 
