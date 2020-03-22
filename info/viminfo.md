# PERSONAL VIM CHEATSHEET

***

[//]: # {{{ DOTO
## DOTO

* vim-grep
* vim-tags
* vim-autoformat
* add abbr

[//]: # }}}

[//]: # {{{ MOVEMENT
## MOVEMENT

* {     - go to next paragraph
* (     - go to next sentence
* [[    - go to next tag (function)
* '[ '] - first, last char of previously changed text
* ''    - goto last jump
* Tab   - match ( [ {
* ]s    - go to next SpellBad
* ,sn   - go to next SpellBad
* \# \*   - search word under the cursor
* o O   - H and L in visual selection

> ### GOTOs
* g,    - goto in jump history back
* g;    - goto in jump history forward
* gB    - previous buffer
* gT    - previous tab
* gV    - goto last visual selection
* gb    - next buffer
* gd    - goes to var definition ( similar to # / * )
* gf    - opens file under cursor
* gi    - goto last edit
* gsn   - go to next SpellBad
* gt    - next tab ( new tab :tab file )
* gv    - visual on last edited line
* viz   - visual in fold

[//]: # }}}

[//]: # {{{ REGISTERS AND MARKS
## REGISTERS AND MARKS

* m{R}        - set mark ( move between files with an uppercase registers )
* '{R}        - go to mark ( move between files with an uppercase registers )
* q{R}q       - clean register
* "{R}y{move} - yank to register ( uppercase R use t append )
* "{R}p       = past from register

[//]: # }}}

[//]: # {{{ LEADER
## LEADER
* ,b    - insert breakpoint [python]
* ,b    - print cmd result to file
* ,c    - count words
* ,e    - execute file [python]
* ,e    - [DOTO] julia ?
* ,e    - compile doc [latex]
* ,e    - [DOTO] markdown ?
* ,f    - open LeaderF plugin
* ,gd   - git diff
* ,gs   - git status
* ,gs   - git status
* ,t    - open terminal
* ,cs   - thesaurus

> ### TOGGLE
* ,/    - toggle search highlight
* ,G    - toggle Goyo
* ,n    - toggle number
* ,ss   - toggle spellcheck
* ,w    - toggle wrap

[//]: # }}}

[//]: # {{{ INSERT MODE & CTRL
## INSERT MODE & CTRL

* <C-c>   - delete a sentence
* <C-f>   - complete file name
* <C-n>   - spelling suggestion
* <C-p>   - complete word
* <C-r>   - paste in normal mode
* <C-w>   - delete a word

> ### NORMAL MODE
* <C-b>   - page up
* <C-d>   - page down 1/2
* <C-f>   - page down
* <C-j>   - next in ale fix list
* <C-k>   - previous in ale fix list
* <C-u>   - page up 1/2
* <C-v>   - standart visual mode
* <C-w>?  - slit actions
* <C-w>r  - swap splits

[//]: # }}}

[//]: # {{{ MISC
## MISC

* I       - insert at begining of line
* W       - in markdown shows repeted words
* Z       - use first spelling suggestion
* ZZ,ZS   - saves
* dgn     - delete next match, gn does action in next hlsearch
* g<C-a>  - in visual mode makes a list of numbers
* gqq     - hard wrap line
* gwip    - join lines in paragraph
* q/      - search history
* z=      - open spelling suggestion
* zR,zM   - open, close all folds
* za      - fold toggle

[//]: # }}}

[//]: # {{{ EX COMMANDS
## EX COMMANDS

* :windo diffthis
* :windo diffoff
* :diffupdate
* :changes
* :%retab
* :[range]write !{cmd}
* :%s//string/g
* :%s/pattern//gn

> ### GLOBALs
* :g/pattern/y {register}
* :g/pattern/d
* :g!/pattern/d or :v/pattern/d
* :g/pattern/t$
* :g/pattern/m$
* :g/^pattern/s/$/string
* :g/pattern/normal {cmd}
* :g/patternA/g/patternb/d
* :g/patternA/g/patternB/
* :g/pattern/# - show list of matches

[//]: # }}}

[//]: # {{{ PLUGINS
## PLUGINS

> ### ALE
* <C-j>   - [NORMAL] next in ale fix list
* <C-k>   - [NORMAL] previous in ale fix list

> ### FUGITIVE
* ,gd   - git diff
* ,gs   - git status
* ,gs   - git status

> ### LEADER-F
* ,f  - opens file finder
* <Tab>   - insert mode
* <C-]> - open in vsplit
* <C-x> - open in hsplit

> ### SURROUND
* ds[  - delete surrounding '['
* cs[( - change surrounding '[' to '('
* S(   - surround visual selection with '('

> ### TABULAR
* :Tabularize \, - for .csv, needs visual mode

> ### THESAURUS
* ,cs  - thesaurus suggestions

[//]: # }}}
