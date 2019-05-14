module Proverb(recite) where

recite :: [String] -> String
recite [] = ""
recite [x] = concat ["And all for the want of a ", x, "."]
recite list@(l:_) = (concat implications) ++ (recite [l])
  where
    implications = zipWith implication (init list) (tail list)
    implication x y = concat ["For want of a ", x, " the ", y, " was lost.\n"]
