(ns series)

(defn slices [string length]
  (map #(apply str %1) (partition length 1 string)))
