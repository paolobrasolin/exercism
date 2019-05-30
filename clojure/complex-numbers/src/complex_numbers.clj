(ns complex-numbers)


(def real first)
(def imaginary second)
(def add (partial map +))
(def sub (partial map -))

(defn- sq [c] (reduce + (map * c c)))

(defn abs [c] (Math/sqrt (sq c)))
(defn conjugate [c] (update c 1 -))

(defn- op [f g [a b] [c d]] [(f (* a c) (* b d)) (g (* b c) (* a d))])

(defn mul [c d] (op - + c d))

(defn div [c [x y :as d]]
  {:pre [(not (== 0 x y))]}
  (let [div #(/ % (double (sq d)))]
    (op (comp div +) (comp div -) c d)))
