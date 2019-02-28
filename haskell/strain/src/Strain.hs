module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep p xs = [x | x <- xs, p x]
keep _ xs = xs

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not.p)
