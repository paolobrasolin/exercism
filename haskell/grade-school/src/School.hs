module School (School, add, empty, grade, sorted) where

import Data.List (groupBy, sortBy, sort)
import Data.Ord (comparing)

data School = School [(Int, String)]

add :: Int -> String -> School -> School
add gradeNum student (School roster) = School $ (gradeNum, student):roster

empty :: School
empty = School []

grade :: Int -> School -> [String]
grade gradeNum (School roster) = getGrade . filterByGradeNum $ roster
  where
    getGrade = sort . map snd
    filterByGradeNum = filter (\x -> fst x == gradeNum) 

sorted :: School -> [(Int, [String])]
sorted (School roster) = getNumberedGrades . groupByGradeNum . sortByGradeNum $ roster
  where
    getNumberedGrades = map (\l -> (getGradeNum l, getGrade l))
    getGradeNum = fst . head
    getGrade = sort . map snd
    groupByGradeNum = groupBy (\x y -> fst x == fst y)
    sortByGradeNum = sortBy (comparing fst)
