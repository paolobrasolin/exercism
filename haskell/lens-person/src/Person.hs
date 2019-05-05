{-# LANGUAGE TemplateHaskell #-}

module Person
  ( Address (..)
  , Born    (..)
  , Name    (..)
  , Person  (..)
  , bornStreet
  , renameStreets
  , setBirthMonth
  , setCurrentStreet
  ) where

import Data.Time.Calendar
import Control.Lens

-- Types

data Person = Person { _name    :: Name
                     , _born    :: Born
                     , _address :: Address
                     }

data Name = Name { _foreNames :: String
                 , _surName   :: String
                 }

data Born = Born { _bornAt :: Address
                 , _bornOn :: Day
                 }

data Address = Address { _street      :: String
                       , _houseNumber :: Int
                       , _place       :: String
                       , _country     :: String
                       }

data Gregorian = Gregorian { _year  :: Integer
                           , _month :: Int
                           , _day   :: Int }

-- Lenses

makeLenses ''Person
makeLenses ''Name
makeLenses ''Born
makeLenses ''Address
makeLenses ''Gregorian

dayGregorian :: Iso' Day Gregorian
dayGregorian = iso dayToGregorian gregorianToDay
  where
    dayToGregorian = (\(y, m, d) -> Gregorian y m d) . toGregorian
    gregorianToDay (Gregorian y m d) = fromGregorian y m d

-- We could also do without Gregorian and dayGregorian:
-- dayMonth :: Lens' Day Int
-- dayMonth f day = fmap (\m' -> fromGregorian y m' d) (f m)
--   where (y, m, d) = toGregorian day

-- Tested interface

bornStreet :: Born -> String
bornStreet = view (bornAt . street)

setCurrentStreet :: String -> Person -> Person
setCurrentStreet = set (address . street)

setBirthMonth :: Int -> Person -> Person
setBirthMonth = set (born . bornOn . dayGregorian . month)

renameStreets :: (String -> String) -> Person -> Person
renameStreets f = (over (address . street) f)
                . (over (born . bornAt . street) f)
