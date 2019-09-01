# hy-fpm

## Install

Paste this macro into your code.

```
(defmacro defnx [name args uri]
  "Define function using code fetched from given URI"
  (import [hy.models [HyExpression]])
  (defn update-fn-name [ast new-name]
    (HyExpression (do (setv lst (list ast)) (assoc lst 1 new-name) lst)))
  ;; Fetch URI content during compilation so that it's cached and subsequent
  ;; program runs don't need to do so again.
  (import [urllib.request [urlopen]])
  (setv ast (-> uri urlopen .read (.decode "utf-8") read-str (update-fn-name name)))
  `(-> ~ast eval))
```

## Usage

```
(defnx sh [cmd] "https://raw.githubusercontent.com/maio/hy-fpm/e4f2fd7e1af3b92af9a8117e4966d43de8480015/process/sh.hy")

(sh "echo hello!")
```
