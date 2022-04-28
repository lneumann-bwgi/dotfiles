(define-configuration browser
  ((session-restore-prompt :never-restore)))

(define-configuration buffer
  ((default-modes (append '(vi-normal-mode) %slot-default%))))

(defvar *my-search-engines*
  (list
   '("arch" "https://wiki.archlinux.org/index.php?search=~a" "https://wiki.archlinux.org")
   '("wiki" "https://en.wikipedia.org/wiki/Special:Search?search=~a" "https://en.wikipedia.org/wiki")
   '("github" "https://github.com/search?q=~a" "https://github.com")
   '("julia" "https://docs.julialang.org/en/v1/search/?q=~a" "https://docs.julialang.org")
   '("python" "https://docs.python.org/3/search.html?q=~a" "https://docs.python.org/3")
   '("ddg" "https://duckduckgo.com/?q=~a" "https://duckduckgo.com")))

(define-configuration buffer
  ((search-engines (append %slot-default%
                           (mapcar (lambda (engine) (apply 'make-search-engine engine))
                                   *my-search-engines*)))))
