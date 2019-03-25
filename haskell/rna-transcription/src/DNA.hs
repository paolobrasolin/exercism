module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA (d:ds) = (:) <$> (nucleotideToRNA d) <*> (toRNA ds)

nucleotideToRNA :: Char -> Either Char Char
nucleotideToRNA d = case d of
  'G' -> Right 'C'
  'C' -> Right 'G'
  'T' -> Right 'A'
  'A' -> Right 'U'
  _   -> Left d
