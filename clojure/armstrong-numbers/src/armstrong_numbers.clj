(ns armstrong-numbers)

(defn digits [n base]
  {:pre [(pos? n) (< 1 base)]}
  (loop [num n acc []]
    (if (< num base)
      (cons num acc)
      (recur (quot num base) (cons (rem num base) acc)))))

(defn pow [base exp]
  {:pre [(not (neg? exp))]}
  (if (zero? exp) 1 (* base (pow base (dec exp)))))

(defn armstrong? [num]
  (let [digs (digits num 10)
        raise #(pow % (count digs))]
  (== num (reduce + (map raise digs)))))
