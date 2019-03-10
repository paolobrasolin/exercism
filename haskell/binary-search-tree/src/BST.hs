module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Node a (BST a) (BST a) | None deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft None = Nothing
bstLeft (Node _ l _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight None = Nothing
bstRight (Node _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue None = Nothing
bstValue (Node v _ _) = Just v

empty :: BST a
empty = None

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) None

insert :: Ord a => a -> BST a -> BST a
insert x None = singleton x
insert x (Node v l r)
    | x <= v = Node v (insert x l) r
    | x >  v = Node v l (insert x r)

singleton :: a -> BST a
singleton x = Node x None None

toList :: BST a -> [a]
toList None = []
toList (Node v l r) = (toList l) ++ [v] ++ (toList r)
