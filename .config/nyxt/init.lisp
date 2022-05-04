;; disable restore history prompt
(define-configuration browser
  ((session-restore-prompt :never-restore)))

;; use vi mode as default
(define-configuration buffer
  ((default-modes (append '(vi-normal-mode) %slot-default%))))

;; vi insert mode in prompt
(define-configuration (buffer prompt-buffer)
     ((default-modes (append '(nyxt::vi-insert-mode) %slot-default%))))

;; add search engines
(defvar *my-search-engines*
  (list
   '("arch" "https://wiki.archlinux.org/index.php?search=~a" "https://wiki.archlinux.org")
   '("google" "https://www.google.com/search?q=~a" "https://www.google.com")
   '("github" "https://github.com/search?q=~a" "https://github.com")
   '("julia" "https://docs.julialang.org/en/v1/search/?q=~a" "https://docs.julialang.org")
   '("python" "https://docs.python.org/3/search.html?q=~a" "https://docs.python.org/3")
   '("so" "https://stackoverflow.com/search?q=~a" "https://stackoverflow.com/")
   '("wiki" "https://en.wikipedia.org/wiki/Special:Search?search=~a" "https://en.wikipedia.org/wiki")
   '("yt" "https://youtube.com/results?search_query=~a" "https://youtube.com/")
   '("ddg" "https://duckduckgo.com/?q=~a" "https://duckduckgo.com")))


(define-configuration buffer
  ((search-engines (append %slot-default%
                           (mapcar (lambda (engine) (apply 'make-search-engine engine))
                                   *my-search-engines*)))))

;;setting new buffer url and having nyxt start full screen
(defmethod nyxt::startup ((browser browser) urls)
  "Home"
  (window-make browser)
  (let ((window (current-window)))
    (window-set-buffer window (make-buffer :url (quri:uri "https://www.duckduckgo.com/"))))
    (toggle-fullscreen window))

;; turn off follow mode for buffers: it screws the access-time order
(define-configuration buffer-source
  ((prompter:follow-p nil)))

;; set colorsheme
;; (nyxt::load-lisp "~/.config/nyxt/statusline.lisp")
;; (nyxt::load-lisp "~/.config/nyxt/stylesheet.lisp")
