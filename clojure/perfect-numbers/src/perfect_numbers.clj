(ns perfect-numbers)

(defn proper-divisors [n]
  (if (neg? n)
    (throw (IllegalArgumentException. "DUH"))
    (filter #(zero? (mod n %)) (range 1 (inc (quot n 2))))))

(defn classify [n]
  (let [aliquot (reduce + (proper-divisors n))]
    (case (compare aliquot n)
      -1 :deficient
       0 :perfect
      +1 :abundant)))
