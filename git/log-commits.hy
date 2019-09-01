(defn log-commits [s]
  "Split standard git log output to list of commits"
  (setv items (.split s "\ncommit "))
  (if (< (len items) 2)
      items
    (+ [(first items)]
       (lfor item (rest items) f"commit {item}"))))
