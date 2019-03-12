module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

type Coordinates = (Integer, Integer)

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum, Bounded)

rotateR :: Bearing -> Bearing
rotateR b
    | maxBound == b = minBound
    | otherwise = succ b

rotateL :: Bearing -> Bearing
rotateL b
    | minBound == b = maxBound
    | otherwise = pred b

toDelta :: Bearing -> Coordinates
toDelta b = [(0,1), (1,0), (0,-1), (-1,0)] !! (fromEnum b)

data Robot = Robot Bearing Coordinates

moveR :: Robot -> Robot
moveR (Robot b cs) = Robot (rotateR b) cs

moveL :: Robot -> Robot
moveL (Robot b cs) = Robot (rotateL b) cs

moveA :: Robot -> Robot
moveA (Robot b cs) = Robot b (sumPairs cs $ toDelta b)
  where sumPairs (x,y) (u,v) = (x+u, y+v)

bearing :: Robot -> Bearing
bearing (Robot b _) = b

coordinates :: Robot -> Coordinates
coordinates (Robot _ cs) = cs

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move robot [] = robot
move robot (i:is) = case i of 'R' -> move (moveR robot) is
                              'L' -> move (moveL robot) is
                              'A' -> move (moveA robot) is
                              _ -> undefined

