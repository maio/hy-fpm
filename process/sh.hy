(defn sh [cmd]
  "Run command using shell and return it's output"
  (import [subprocess [getoutput]])
  (getoutput cmd))
