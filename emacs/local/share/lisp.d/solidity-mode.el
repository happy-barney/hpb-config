;;; solidity-mode.el --- Major mode for editing Solidity code

;; Copyright (C) 2025 

;; Author: Claude
;; Keywords: languages
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a major mode for editing Solidity smart contract code.
;; Features:
;; - Syntax highlighting
;; - Auto-indentation
;; - Customizable indentation level
;; - NatSpec documentation support
;; - Code folding via outline-minor-mode

;;; Code:

(require 'cc-mode)
(require 'cc-fonts)
(require 'outline)

;; ---- CUSTOMIZATION OPTIONS ----

(defgroup solidity nil
  "Major mode for editing Solidity code."
  :group 'languages
  :prefix "solidity-")

(defcustom solidity-indent-level 4
  "Number of spaces for each indentation step in `solidity-mode'."
  :type 'integer
  :safe 'integerp
  :group 'solidity)

;; ---- NATSPEC DOCUMENTATION TAGS ----

(defconst solidity-natspec-tags
  '("@title" "@author" "@notice" "@dev" "@param" "@return" "@inheritdoc"
    "@custom" "@requires" "@throws" "@deprecated" "@license"
    "@inheritdoc" "@custom:experimental"))

;; ---- FONT LOCK (SYNTAX HIGHLIGHTING) ----

(defconst solidity-keywords
  '("abstract" "after" "anonymous" "as" "assembly" "break" "catch" "constant"
    "constructor" "continue" "contract" "do" "else" "enum" "emit" "error" "event"
    "external" "fallback" "for" "function" "if" "immutable" "implements"
    "import" "indexed" "interface" "internal" "is" "library" "mapping"
    "memory" "modifier" "new" "override" "payable" "pragma" "private"
    "public" "pure" "receive" "return" "returns" "revert" "solidity"
    "storage" "struct" "throw" "try" "type" "using" "view" "virtual" "while"))

(defconst solidity-constants
  '("true" "false" "wei" "szabo" "finney" "ether" "seconds" "minutes" "hours"
    "days" "weeks" "years" "now" "this" "super"))

(defconst solidity-builtin-types
  '("address" "bool" "byte" "bytes" "bytes1" "bytes2" "bytes3" "bytes4"
    "bytes5" "bytes6" "bytes7" "bytes8" "bytes9" "bytes10" "bytes11"
    "bytes12" "bytes13" "bytes14" "bytes15" "bytes16" "bytes17" "bytes18"
    "bytes19" "bytes20" "bytes21" "bytes22" "bytes23" "bytes24" "bytes25"
    "bytes26" "bytes27" "bytes28" "bytes29" "bytes30" "bytes31" "bytes32"
    "int" "int8" "int16" "int24" "int32" "int40" "int48" "int56" "int64"
    "int72" "int80" "int88" "int96" "int104" "int112" "int120" "int128"
    "int136" "int144" "int152" "int160" "int168" "int176" "int184" "int192"
    "int200" "int208" "int216" "int224" "int232" "int240" "int248" "int256"
    "mapping" "string" "uint" "uint8" "uint16" "uint24" "uint32" "uint40"
    "uint48" "uint56" "uint64" "uint72" "uint80" "uint88" "uint96" "uint104"
    "uint112" "uint120" "uint128" "uint136" "uint144" "uint152" "uint160"
    "uint168" "uint176" "uint184" "uint192" "uint200" "uint208" "uint216"
    "uint224" "uint232" "uint240" "uint248" "uint256" "var"))

(defconst solidity-builtin-functions
  '("addmod" "assert" "block" "blockhash" "ecrecover" "gasleft" "keccak256"
    "msg" "mulmod" "require" "revert" "selfdestruct" "sha256" "suicide" "tx"))

(defconst solidity-font-lock-keywords
  (list
   ;; Keywords
   `(,(regexp-opt solidity-keywords 'words) . font-lock-keyword-face)
   ;; Constants
   `(,(regexp-opt solidity-constants 'words) . font-lock-constant-face)
   ;; Types
   `(,(regexp-opt solidity-builtin-types 'words) . font-lock-type-face)
   ;; Builtin functions
   `(,(regexp-opt solidity-builtin-functions 'words) . font-lock-builtin-face)
   ;; NatSpec tags in comments
   `(,(concat "/\\*\\*\\|///.*\\(" (regexp-opt solidity-natspec-tags) "\\)\\>") 
     1 font-lock-doc-face t)
   ;; NatSpec parameter names
   '("@param\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 1 font-lock-variable-name-face t)
   ;; NatSpec custom tags
   '("@custom:\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 1 font-lock-constant-face t)
   ;; Function names
   '("\\<function\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 1 font-lock-function-name-face)
   ;; Contract/library/interface names
   '("\\<\\(contract\\|library\\|interface\\)\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 2 font-lock-type-face)
   ;; Custom types (structs, enums)
   '("\\<\\(struct\\|enum\\)\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 2 font-lock-type-face)
   ;; Visibility modifiers
   '("\\<\\(public\\|private\\|internal\\|external\\)\\>" . font-lock-keyword-face)
   ;; Pragmas
   '("\\<pragma\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 1 font-lock-preprocessor-face)
   ;; Event names
   '("\\<event\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" 1 font-lock-variable-name-face)
   ;; Numbers
   '("\\<\\([0-9]+\\)\\>" 1 font-lock-constant-face)
   ))

;; ---- INDENTATION ----

(defun solidity-indent-line ()
  "Indent current line as Solidity code."
  (interactive)
  (let* ((savep (point))
         (was-beginning-of-line (= (point) (line-beginning-position)))
         (indent-col
          (save-excursion
            (back-to-indentation)
            (let ((state (syntax-ppss))
                  (pos (point)))
              (cond
               ;; Inside comment or string
               ((nth 8 state)
                (current-indentation))
               
               ;; Closing brace/paren/bracket as first non-whitespace character
               ((looking-at "[]})]")
                (let ((matching-pos (save-excursion
                                      (forward-char)
                                      (backward-list)
                                      (point))))
                  (goto-char matching-pos)
                  (current-indentation)))
               
               ;; Default indentation logic
               (t
                (goto-char (nth 1 state))
                (if (looking-at "[({[]")
                    (+ (current-indentation) solidity-indent-level)
                  (let ((start-of-line-pos (line-beginning-position)))
                    (skip-chars-backward " \t\n")
                    (if (and (looking-back ";" (- (point) 1))
                             (not (> (nth 0 state) 0)))
                        (current-indentation)
                      (if (looking-at "}")
                          (- (current-indentation) solidity-indent-level)
                        (current-indentation))))))))))
         )
    ;; Indent the line
    (if (< (current-column) (current-indentation))
        (indent-line-to indent-col)
      (save-excursion (indent-line-to indent-col)))
    
    ;; If we were at the beginning of the line, move to the first non-whitespace character
    (when was-beginning-of-line
      (back-to-indentation))))

;; ---- OUTLINE MODE INTEGRATION ----

(defconst solidity-outline-regexp
  (concat
   ;; Match contract, library, interface declarations
   "\\(^\\s-*\\(contract\\|library\\|interface\\)\\s-+[a-zA-Z_][a-zA-Z0-9_]*\\)"
   "\\|"
   ;; Match function, event, struct, enum declarations
   "\\(^\\s-*\\(function\\|event\\|struct\\|enum\\)\\s-+[a-zA-Z_][a-zA-Z0-9_]*\\)"
   "\\|"
   ;; Match NatSpec comment blocks
   "\\(^\\s-*\\(?:/\\*\\*\\|///\\)\\)"))

(defun solidity-outline-level ()
  "Return the depth to which a statement is nested in the outline.
Point must be at the beginning of a header line."
  (let ((pt (match-beginning 0))
        (outline-level 0))
    (save-excursion
      ;; Count the number of braces or contract-level declarations
      (if (looking-at "^\\s-*\\(contract\\|library\\|interface\\)")
          (setq outline-level 1)
        (setq outline-level 2)
        ;; Additional levels for nested blocks determined by indentation
        (when (> (current-indentation) 0)
          (setq outline-level (+ outline-level (/ (current-indentation) solidity-indent-level)))))
      outline-level)))

(defun solidity-outline-setup ()
  "Set up outline mode for solidity."
  (setq-local outline-regexp solidity-outline-regexp)
  (setq-local outline-level 'solidity-outline-level)
  
  ;; Custom outline behavior for Solidity
  (setq-local outline-blank-line (lambda () nil))
  
  ;; Function to determine end of heading (including trailing whitespace and paired chars)
  (setq-local outline-heading-end-regexp "\\(?:\\s-*$\\|\n\\)")
  
  ;; Custom outline heading computation for proper folding behavior
  (defun solidity-outline-compute-heading ()
    "Compute the Solidity outline heading."
    (save-excursion
      (let ((beg (match-beginning 0))
            (comment-start-p (looking-at "\\s-*\\(?:/\\*\\*\\|///\\)")))
        ;; If this is a comment heading
        (if comment-start-p
            ;; Collect all subsequent comment and whitespace lines
            (progn
              (forward-line)
              (while (or (looking-at "\\s-*\\(?:/\\*\\|\\*/\\|///\\)") 
                         (looking-at "\\s-*$"))
                (forward-line))
              (point))
          ;; Otherwise compute normal heading end (including matched braces)
          (goto-char (point-at-eol))
          (when (re-search-forward "{" nil t)
            (let ((brace-level 1))
              (forward-char -1)
              (forward-sexp)
              (while (and (looking-at "\\s-*$") (< (point) (point-max)))
                (forward-line))
              (point)))))))
  
  (setq-local outline-heading-alist
              '(("contract" . 1)
                ("library" . 1)
                ("interface" . 1)
                ("function" . 2)
                ("event" . 2)
                ("struct" . 2)
                ("enum" . 2)))
  (outline-minor-mode 1))

;; ---- MODE DEFINITION ----

(defvar solidity-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; C/C++ style comments
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    ;; String literals
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?\' "\"" st)
    ;; Char constants are the same as strings
    (modify-syntax-entry ?\\ "\\" st)
    ;; Treat underscores as part of words
    (modify-syntax-entry ?_ "w" st)
    st)
  "Syntax table for solidity-mode.")

;;;###autoload
(define-derived-mode solidity-mode c-mode "Solidity"
  "Major mode for editing Solidity code.
\\{solidity-mode-map}"
  :syntax-table solidity-mode-syntax-table
  (setq-local font-lock-defaults '(solidity-font-lock-keywords))
  (setq-local indent-line-function 'solidity-indent-line)
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local comment-start-skip "//+\\s-*")
  (setq-local paragraph-start "\\s-*//.*$\\|\\s-*$")
  (setq-local paragraph-separate "\\s-*//.*$\\|\\s-*$")
  
  ;; Use tab width from indent-tabs-mode
  (setq-local tab-width solidity-indent-level)
  (setq-local indent-tabs-mode nil)
  
  ;; Setup outline mode integration
  (solidity-outline-setup))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sol\\'" . solidity-mode))

;; ---- DOCUMENTATION NAVIGATION AND GENERATION ----

(defvar-local solidity-last-jump-pos nil
  "Store the last position before jumping to documentation.")

(defun solidity-find-identifier-at-point ()
  "Return the identifier at point, or nil if none is found."
  (let ((bounds (bounds-of-thing-at-point 'symbol)))
    (when bounds
      (buffer-substring-no-properties (car bounds) (cdr bounds)))))

(defun solidity-find-function-parameter (function-name param-name)
  "Find parameter definition for PARAM-NAME in FUNCTION-NAME."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward (format "function\\s-+%s\\s-*(\\([^)]*\\))" 
                                    (regexp-quote function-name)) nil t)
      (let ((params (match-string 1))
            (found nil))
        (when (string-match (format "\\b%s\\b" (regexp-quote param-name)) params)
          (setq found t))
        found))))

(defun solidity-find-current-function-name ()
  "Find the name of the function containing point."
  (save-excursion
    (let ((orig-point (point))
          function-name)
      ;; Search backward for function definition
      (when (re-search-backward "function\\s-+\\([a-zA-Z_][a-zA-Z0-9_]*\\)" nil t)
        (setq function-name (match-string-no-properties 1))
        ;; Check if we're still in this function's scope
        (let ((func-start (point))
              (brace-level 0)
              (found-open nil))
          ;; Find opening brace of function
          (when (re-search-forward "{" nil t)
            (setq found-open t)
            (setq brace-level 1)
            ;; Track brace level to find closing brace
            (while (and (> brace-level 0) (re-search-forward "[{}]" nil t))
              (if (string= (match-string 0) "{")
                  (setq brace-level (1+ brace-level))
                (setq brace-level (1- brace-level))))
            ;; Check if original point is within function bounds
            (when (and found-open (>= orig-point func-start) (<= orig-point (point)))
              function-name))))
      function-name)))

(defun solidity-find-natspec-param-tag (param-name &optional function-name)
  "Find NatSpec @param tag for PARAM-NAME, optionally in FUNCTION-NAME's context."
  (save-excursion
    (goto-char (point-min))
    (let ((search-regexp (if function-name
                            (format "\\(/\\*\\*\\|///\\)\\(.*\n\\)*?.*@param\\s-+%s\\b" 
                                    (regexp-quote param-name))
                          (format "\\(/\\*\\*\\|///\\)\\(.*\n\\)*?.*@param\\s-+%s\\b"
                                 (regexp-quote param-name)))))
      (when (re-search-forward search-regexp nil t)
        (goto-char (match-beginning 0))
        (forward-line)
        (point)))))

(defun solidity-find-natspec-dev-tag (function-name)
  "Find NatSpec @dev tag for FUNCTION-NAME."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward (format "\\(/\\*\\*\\|///\\)\\(.*\n\\)*?.*function\\s-+%s\\b" 
                                     (regexp-quote function-name)) nil t)
      (goto-char (match-beginning 0))
      (when (re-search-forward "@dev" (point-at-eol) t)
        (goto-char (match-beginning 0))
        (point)))))

(defun solidity-find-function-natspec (function-name)
  "Find NatSpec documentation block for FUNCTION-NAME."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward (format "\\(/\\*\\*\\|///\\)\\(.*\n\\)*?.*function\\s-+%s\\b" 
                                    (regexp-quote function-name)) nil t)
      (goto-char (match-beginning 0))
      (point))))

(defun solidity-insert-natspec-for-param (param-name function-name)
  "Insert NatSpec documentation template for PARAM-NAME in FUNCTION-NAME."
  (save-excursion
    (let ((natspec-pos (solidity-find-function-natspec function-name))
          inserted)
      (if natspec-pos
          ;; Add to existing NatSpec block
          (progn
            (goto-char natspec-pos)
            ;; Find the end of the NatSpec comment block
            (let ((comment-style (if (looking-at "/\\*\\*") "block" "line"))
                  (end-pos nil))
              (if (string= comment-style "block")
                  (when (re-search-forward "\\*/" nil t)
                    (goto-char (match-beginning 0))
                    (setq end-pos (point)))
                ;; For line comments, find last /// line
                (let ((start-pos (point)))
                  (while (looking-at "\\s-*///")
                    (forward-line)
                    (setq end-pos (point)))
                  (when end-pos
                    (goto-char end-pos)
                    (forward-line -1)
                    (end-of-line))))
              
              (when end-pos
                (if (string= comment-style "block")
                    (insert "\n * @param " param-name " Description of " param-name)
                  (insert "\n/// @param " param-name " Description of " param-name))
                (setq inserted t))))
        
        ;; Create new NatSpec block
        (goto-char (point-min))
        (when (re-search-forward (format "function\\s-+%s\\b" (regexp-quote function-name)) nil t)
          (beginning-of-line)
          (insert "/// @notice Function description\n")
          (insert "/// @dev Detailed description\n")
          (insert "/// @param " param-name " Description of " param-name "\n")
          (insert "/// @return Description of return value\n")
          (setq inserted t)))
      
      inserted)))

(defun solidity-jump-to-documentation (arg)
  "Jump to NatSpec documentation for identifier at point.
With universal prefix ARG, jump back to previous position."
  (interactive "P")
  
  (if arg
      ;; Jump back to previous position
      (when solidity-last-jump-pos
        (goto-char solidity-last-jump-pos)
        (setq solidity-last-jump-pos nil))
    
    ;; Store current position for jumping back
    (setq solidity-last-jump-pos (point))
    
    (let* ((id (solidity-find-identifier-at-point))
           (function-name (solidity-find-current-function-name))
           (doc-pos nil)
           (is-param nil))
      
      (when (and id function-name)
        ;; Check if identifier is a parameter in current function
        (setq is-param (solidity-find-function-parameter function-name id))
        
        (if is-param
            ;; Try to find @param documentation
            (setq doc-pos (solidity-find-natspec-param-tag id function-name))
          
          ;; If identifier is the function name itself, find @dev or function docs
          (when (string= id function-name)
            (setq doc-pos (or (solidity-find-natspec-dev-tag function-name)
                             (solidity-find-function-natspec function-name)))))
        
        (if doc-pos
            ;; Jump to documentation
            (goto-char doc-pos)
          
          ;; No documentation found, insert template if it's a parameter
          (when is-param
            (message "No documentation found for %s, inserting template..." id)
            (when (solidity-insert-natspec-for-param id function-name)
              (setq doc-pos (solidity-find-natspec-param-tag id function-name))
              (when doc-pos
                (goto-char doc-pos)))))))))

;; ---- ADDITIONAL UTILITY FUNCTIONS ----

(defun solidity-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
Handles both // and /** ... */ comment styles appropriately.
If region is active, use region. Otherwise use line."
  (interactive "*P")
  (comment-dwim arg))

(defun solidity-comment-natspec-dwim (arg)
  "Add NatSpec comment to current line or region.
Inserts '///' style NatSpec comment."
  (interactive "*P")
  (let ((comment-start "/// ")
        (comment-end ""))
    (comment-dwim arg)))

(defun solidity-comment-natspec-multiline-dwim (arg)
  "Add multiline NatSpec comment to current line or region.
Inserts '/** ... */' style NatSpec comment."
  (interactive "*P")
  (let ((comment-start "/** ")
        (comment-end " */"))
    (comment-dwim arg)))

(defvar solidity-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") 'solidity-comment-dwim)
    (define-key map (kbd "C-c C-d") 'solidity-comment-natspec-dwim) 
    (define-key map (kbd "C-c C-m") 'solidity-comment-natspec-multiline-dwim)
    (define-key map (kbd "C-c C-j") 'solidity-jump-to-documentation)
    map)
  "Keymap for solidity-mode.")

(provide 'solidity-mode)
;;; solidity-mode.el ends here
