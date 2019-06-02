module WordProblem (answer) where

import Text.ParserCombinators.Parsec

number :: Parser Double
number = negativeNumber <|> unsignedNumber
  where unsignedNumber = read <$> many1 digit
        negativeNumber = char '-' *> (negate <$> unsignedNumber)

operator :: Parser (Double -> Double -> Double)
operator = many space *> anyOperator <* many space
  where op f s = try $ string s *> pure f
        anyOperator = op (+) "plus" <|>
                      op (-) "minus" <|>
                      op (*) "multiplied by" <|>
                      op (/) "divided by"

question :: Parser Double
question = string "What is " *> chainl1 number operator <* char '?'

answer :: String -> Maybe Double
answer = either (const Nothing) Just . parse question ""
