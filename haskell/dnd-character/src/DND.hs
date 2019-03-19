module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Data.List (sort)
import Test.QuickCheck (
  Arbitrary, 
  Gen, 
  arbitrary,
  choose, 
  vectorOf)

data Character = Character
  { name         :: String
  , strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier n = div (n - 10) 2

ability :: Gen Int
ability = do
  throws <- vectorOf 4 $ choose(1, 6)
  return $ sum.tail.sort $ throws

instance Arbitrary Character where
  arbitrary = do
    name <- arbitrary
    str <- ability
    dex <- ability
    con <- ability
    int <- ability
    wis <- ability
    cha <- ability
    let hp = 10 + modifier con
    return (Character name str dex con int wis cha hp)

character :: Gen Character
character = arbitrary :: Gen Character
