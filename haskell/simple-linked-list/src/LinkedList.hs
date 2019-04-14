module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Node a (LinkedList a) | Null deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Node x _) = x

fromList :: [a] -> LinkedList a
fromList [] = Null
fromList (x:xs) = Node x (fromList xs)

isNil :: LinkedList a -> Bool
isNil Null = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x = Node x

next :: LinkedList a -> LinkedList a
next (Node _ l) = l

nil :: LinkedList a
nil = Null

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = f Null
  where
    f l Null = l
    f l (Node x m) = f (Node x l) m

toList :: LinkedList a -> [a]
toList Null = []
toList (Node x l) = x : toList l
