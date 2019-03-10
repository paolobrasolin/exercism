module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = [[choose n k | k <- [0..n]] | n <- [0..x-1]]
  where
    choose n k = toInteger $ div (factorial n) $ (factorial k) * (factorial $ n - k)
    factorial n = product [1..n]
