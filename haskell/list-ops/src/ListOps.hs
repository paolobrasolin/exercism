module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z [] = z
foldl' f z (x:xs) = let z' = f z x in seq z' (foldl' f z' xs)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

length :: [a] -> Int
length = foldl' (flip $ const (+1)) 0

reverse :: [a] -> [a]
reverse xs = foldl' (flip (:)) [] xs

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x -> ((f x):)) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x -> if p x then (x:) else id) []

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
