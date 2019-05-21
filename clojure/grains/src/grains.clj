(ns grains)

(defn exponentiation [base exponent]
  {:pre [(not (neg? exponent))]}
  (if (zero? exponent) 1 (*' base (exponentiation base (dec exponent)))))

(defn square [n] (exponentiation 2 (dec n)))

(defn total [] (dec (square (inc 64))))
