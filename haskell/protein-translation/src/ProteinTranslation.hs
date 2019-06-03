{-# LANGUAGE OverloadedStrings #-}

module ProteinTranslation(proteins) where

type Codon = String
type Protein = String
type Sequence = String

proteins :: Sequence -> Maybe [Protein]
proteins sequence = takeWhile (/= "STOP") <$> translateSequence sequence

translateSequence :: Sequence -> Maybe [Protein]
translateSequence [] = Just []
translateSequence sequence = (:) <$> translateCodon codon <*> translateSequence remainder
  where (codon, remainder) = splitAt 3 sequence

translateCodon :: Codon -> Maybe Protein
translateCodon c
  | elem c ["AUG"]                      = Just "Methionine"
  | elem c ["UUU", "UUC"]               = Just "Phenylalanine"
  | elem c ["UUA", "UUG"]               = Just "Leucine"
  | elem c ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
  | elem c ["UAU", "UAC"]               = Just "Tyrosine"
  | elem c ["UGU", "UGC"]               = Just "Cysteine"
  | elem c ["UGG"]                      = Just "Tryptophan"
  | elem c ["UAA", "UAG", "UGA"]        = Just "STOP"
  | otherwise                           = Nothing
