module DNA (toRNA) where

import Control.Applicative (liftA2)

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA (d:ds) = liftA2 (:) (nucleotideToRNA d) (toRNA ds)

nucleotideToRNA :: Char -> Either Char Char
nucleotideToRNA d = case d of
  'G' -> Right 'C'
  'C' -> Right 'G'
  'T' -> Right 'A'
  'A' -> Right 'U'
  _   -> Left d
