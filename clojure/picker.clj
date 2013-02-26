#! /usr/bin/java -jar /Users/bcabalo/Downloads/clojure-1.4.0/clojure-1.4.0.jar 

;(println (+ 1 1))

(defn select [total]
  (def selection nil)
  (def r (rand-int total))
  (def selection r)
  selection 
)

;(loop [x 0]
;  (when (> x 1)
;    (println x)
;    (recur (+ x 1))))

(def total 27)
(println (select total))
