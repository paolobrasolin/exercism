(ns space-age)

(def ^:const one-earth-year-in-seconds 31557600)

(defn on-earth   [seconds] (/ seconds (*   1.0        one-earth-year-in-seconds)))
(defn on-mercury [seconds] (/ seconds (*   0.2408467  one-earth-year-in-seconds))) 
(defn on-venus   [seconds] (/ seconds (*   0.61519726 one-earth-year-in-seconds)))
(defn on-mars    [seconds] (/ seconds (*   1.8808158  one-earth-year-in-seconds)))
(defn on-jupiter [seconds] (/ seconds (*  11.862615   one-earth-year-in-seconds)))
(defn on-saturn  [seconds] (/ seconds (*  29.447498   one-earth-year-in-seconds)))
(defn on-uranus  [seconds] (/ seconds (*  84.016846   one-earth-year-in-seconds)))
(defn on-neptune [seconds] (/ seconds (* 164.79132    one-earth-year-in-seconds)))
