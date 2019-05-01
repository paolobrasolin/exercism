(ns collatz-conjecture)

(defn collatz-step [num]
  (if (odd? num) (inc (* 3 num)) (/ num 2)))

(defn collatz-step-safe [num]
  (if (pos? num)
    (collatz-step num)
    (throw (Throwable. "WHOOPS"))))

(defn collatz [num]
  (count (take-while #(not= %1 1) (iterate collatz-step-safe num))))
