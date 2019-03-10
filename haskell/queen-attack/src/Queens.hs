module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = join cells
  where
    join = unlines . (map $ unwords . map draw)
    cells = [[Just (r, c) | c <- [0..7]] | r <- [0..7]]
    draw cell
      | cell == white = "W"
      | cell == black = "B"
      | otherwise = "_"

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (ra, ca) (rb, cb) = sameRow || sameCol || sameDia
  where
    sameRow = ra == rb
    sameCol = ca == cb
    sameDia = abs (ra - rb) == abs (ca - cb)
