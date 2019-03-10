module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n
  | includesBits reversalBits = reverse moves
  | otherwise = moves
  where
    moves = [move | (bits, move) <- stdMovesBits, includesBits bits]
    includesBits bits = n .&. bits == bits
    stdMovesBits = [
      (1, "wink"), 
      (2, "double blink"), 
      (4, "close your eyes"), 
      (8, "jump")]
    reversalBits = 16
