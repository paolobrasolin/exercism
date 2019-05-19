module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import Prelude hiding (null)

import qualified Data.List (nub, intersect, (\\), union, delete)

data CustomSet a = CustomSet [a] deriving (Show)

instance (Eq a) => Eq (CustomSet a) where
  (CustomSet xs) == (CustomSet ys) =
    xs == Data.List.intersect xs ys && ys == Data.List.intersect ys xs

delete :: (Eq a) => a -> CustomSet a -> CustomSet a
delete x (CustomSet xs) = CustomSet (Data.List.delete x xs)

difference :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
difference (CustomSet xs) (CustomSet ys) = CustomSet (xs Data.List.\\ ys)

empty :: (Eq a) => CustomSet a
empty = CustomSet []

fromList :: (Eq a) => [a] -> CustomSet a
fromList xs = CustomSet $ Data.List.nub xs

insert :: (Eq a) => a -> CustomSet a -> CustomSet a
insert x set@(CustomSet xs) = case elem x xs of
                                False -> CustomSet (x:xs)
                                True -> set

intersection :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
intersection (CustomSet xs) (CustomSet ys) = CustomSet (Data.List.intersect xs ys)

isDisjointFrom :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isDisjointFrom (CustomSet xs) set = not $ any (\x -> member x set) xs

isSubsetOf :: (Eq a) => CustomSet a -> CustomSet a -> Bool
isSubsetOf (CustomSet xs) set = all (\x -> member x set) xs

member :: (Eq a) => a -> CustomSet a -> Bool
member x (CustomSet xs) = elem x xs

null :: CustomSet a -> Bool
null (CustomSet []) = True
null _ = False

size :: CustomSet a -> Int
size (CustomSet xs) = length xs

toList :: CustomSet a -> [a]
toList (CustomSet xs) = xs

union :: (Eq a) => CustomSet a -> CustomSet a -> CustomSet a
union (CustomSet xs) (CustomSet ys) = CustomSet (Data.List.union xs ys)
