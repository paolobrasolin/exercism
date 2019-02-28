module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock Int

getM :: Clock -> Int
getM (Clock ms) = mod ms 60

getH :: Clock -> Int
getH (Clock ms) = mod (div ms 60) 24

isZero :: Clock -> Bool
isZero c = getH c == 0 && getM c == 0

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock $ h * 60 + m

toString :: Clock -> String
toString c = printf "%02d:%02d" (getH c) (getM c)

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock ms) = Clock $ ms + h * 60 + m

instance Eq Clock where
  Clock ms == Clock ns = isZero $ Clock $ ms - ns 