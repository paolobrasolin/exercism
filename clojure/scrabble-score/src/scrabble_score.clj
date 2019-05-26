(ns scrabble-score)

(defn from-fibers [fibers]
  (into (hash-map) (flatten (for [[p ls] fibers] (for [l ls] {l p})))))

(defn score-letter [l]
  (let [fibers 
    {
      1 "AEIOULNRST"
      2 "DG"
      3 "BCMP"
      4 "FHVWY"
      5 "K"
      8 "JX"
      10 "QZ"
    }
  ]
  (apply (from-fibers fibers) (clojure.string/upper-case l))))

(defn score-word [word]
  (reduce + (map score-letter word)))
