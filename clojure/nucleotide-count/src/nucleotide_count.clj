(ns nucleotide-count)

(def empty-counter {\A 0 \T 0 \C 0 \G 0})

(defn ensure-valid [nucleotide f]
  (if (contains? empty-counter nucleotide)
    f
    (throw (Throwable. "Invalid nucleotide!"))))

(defn update-counter [counts nucleotide]
  (ensure-valid nucleotide
                (update-in counts [nucleotide] inc)))

(defn nucleotide-counts [strand]
  (reduce update-counter empty-counter strand))

(defn count [nucleotide strand]
  (ensure-valid nucleotide
                (get (nucleotide-counts strand) nucleotide)))

