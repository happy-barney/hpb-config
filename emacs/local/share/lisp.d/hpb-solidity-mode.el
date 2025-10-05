;;; hpb-solidity-mode.el --- Major mode for editing Solidity code

;; Copyright (C) 2025 ...

;; Author: generated using GenLLM
;; Version: 0.1.0
;; Keywords: languages
;; Package-Requires: ((emacs "25.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A major mode for editing Solidity smart contract code.
;; Features include:
;;  - Syntax highlighting
;;  - Auto-indentation
;;  - NatSpec documentation support
;;  - Code folding via outline-minor-mode
;;  - Documentation jump functionality
;;  - imenu integration

;;; Code:

(require 'cc-mode)
(require 'cc-fonts
(require 'outline)
(require 'subword)

;;; Customization options

(defgroup hpb-solidity nil
  "Major mode for editing Solidity code."
  :group 'languages
  :prefix "hpb-solidity-"
  )

(defcustom hpb-solidity-indent-level 4
  "Number of spaces to indent Solidity code."
  :group 'hpb-solidity
  :type 'integer
  )

(defcustom hpb-solidity-indent-with-tabs nil
  "Number of spaces to indent Solidity code."
  :group 'hpb-solidity
  :type 'boolean
  )

(defcustom hpb-solidity-natspec-tag-face-alist
  '(("@title" . font-lock-doc-face)
    ("@author" . font-lock-doc-face)
    ("@notice" . font-lock-doc-face)
    ("@dev" . font-lock-doc-face)
    ("@param" . font-lock-doc-face)
    ("@return" . font-lock-doc-face)
    ("@inheritdoc" . font-lock-doc-face)
    ("@custom" . font-lock-doc-face))
  "Alist of NatSpec tags and their corresponding faces."
  :type '(alist :key-type string :value-type face)
  :group 'hpb-solidity)

;;; Face definitions

(defface hpb-solidity-contract-name-face
  '((t (:inherit font-lock-function-name-face)))
  "Face used for contract names."
  :group 'hpb-solidity)

(defface hpb-solidity-error-name-face
  '((t (:inherit font-lock-function-name-face)))
  "Face used for error names."
  :group 'hpb-solidity)

(defface hpb-solidity-event-name-face
  '((t (:inherit font-lock-function-name-face)))
  "Face used for event names."
  :group 'hpb-solidity)

(defface hpb-solidity-modifier-name-face
  '((t (:inherit font-lock-function-name-face)))
  "Face used for modifier names."
  :group 'hpb-solidity)

(defface hpb-solidity-function-name-face
  '((t (:inherit font-lock-function-name-face)))
  "Face used for function names."
  :group 'hpb-solidity)

(defface hpb-solidity-struct-name-face
  '((t (:inherit font-lock-type-face)))
  "Face used for struct names."
  :group 'hpb-solidity)

(defface hpb-solidity-test-function-name-face
  '((t (:inherit font-lock-function-name-face :foreground "deep pink")))
  "Face used for test function names."
  :group 'hpb-solidity)

(defface hpb-solidity-natspec-param-name-face
  '((t (:inherit font-lock-variable-name-face)))
  "Face used for NatSpec parameter names."
  :group 'hpb-solidity)

;;; Syntax table

(defvar hpb-solidity-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; Comment syntax
    (modify-syntax-entry ?/ ". 124b" table)
    (modify-syntax-entry ?* ". 23" table)
    (modify-syntax-entry ?\n "> b" table)

    ;; String literals
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?\' "\"" table)

    ;; Paired delimiters
    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)
    (modify-syntax-entry ?\{ "(}" table)
    (modify-syntax-entry ?\} "){" table)
    (modify-syntax-entry ?\[ "(]" table)
    (modify-syntax-entry ?\] ")[" table)

    ;; ;; Operators
    ;; (modify-syntax-entry ?+ "." table)
    ;; (modify-syntax-entry ?- "." table)
    ;; (modify-syntax-entry ?* "." table)
    ;; (modify-syntax-entry ?/ "." table)
    ;; (modify-syntax-entry ?% "." table)
    ;; (modify-syntax-entry ?& "." table)
    ;; (modify-syntax-entry ?| "." table)
    ;; (modify-syntax-entry ?^ "." table)
    ;; (modify-syntax-entry ?! "." table)
    ;; (modify-syntax-entry ?= "." table)
    ;; (modify-syntax-entry ?< "." table)
    ;; (modify-syntax-entry ?> "." table)
    ;; (modify-syntax-entry ?: "." table)

    ;; Symbol constituents
    (modify-syntax-entry ?_ "_" table)
    (modify-syntax-entry ?$ "_" table)

    table)
  "Syntax table for `hpb-solidity-mode'.")

;;; Keywords

(defconst hpb-solidity-keywords
  '("abstract" "address" "anonymous" "as" "assembly" "bool" "break" "byte" "bytes"
    "calldata" "case" "catch" "constant" "constructor" "continue" "contract" "default"
    "delete" "do" "else" "emit" "enum" "error" "event" "external" "fallback" "false"
    "fixed" "for" "function" "gas" "if" "immutable" "import" "in" "indexed" "interface"
    "internal" "is" "let" "library" "mapping" "memory" "modifier" "new" "override"
    "payable" "pragma" "private" "public" "pure" "receive" "return" "returns" "revert"
    "storage" "string" "struct" "switch" "this" "throw" "true" "try" "type" "ufixed"
    "uint" "unchecked" "using" "var" "view" "virtual" "while")
  "Solidity keywords.")

(defconst hpb-solidity-builtin-types
  '("address" "bool" "string" "var" "bytes" "bytes1" "bytes2" "bytes3" "bytes4"
    "bytes5" "bytes6" "bytes7" "bytes8" "bytes9" "bytes10" "bytes11" "bytes12"
    "bytes13" "bytes14" "bytes15" "bytes16" "bytes17" "bytes18" "bytes19" "bytes20"
    "bytes21" "bytes22" "bytes23" "bytes24" "bytes25" "bytes26" "bytes27" "bytes28"
    "bytes29" "bytes30" "bytes31" "bytes32" "int" "int8" "int16" "int24" "int32"
    "int40" "int48" "int56" "int64" "int72" "int80" "int88" "int96" "int104"
    "int112" "int120" "int128" "int136" "int144" "int152" "int160" "int168"
    "int176" "int184" "int192" "int200" "int208" "int216" "int224" "int232"
    "int240" "int248" "int256" "uint" "uint8" "uint16" "uint24" "uint32" "uint40"
    "uint48" "uint56" "uint64" "uint72" "uint80" "uint88" "uint96" "uint104"
    "uint112" "uint120" "uint128" "uint136" "uint144" "uint152" "uint160" "uint168"
    "uint176" "uint184" "uint192" "uint200" "uint208" "uint216" "uint224" "uint232"
    "uint240" "uint248" "uint256" "fixed" "fixed0x8" "fixed0x16" "fixed0x24"
    "fixed0x32" "fixed0x40" "fixed0x48" "fixed0x56" "fixed0x64" "fixed0x72"
    "fixed0x80" "fixed0x88" "fixed0x96" "fixed0x104" "fixed0x112" "fixed0x120"
    "fixed0x128" "fixed0x136" "fixed0x144" "fixed0x152" "fixed0x160" "fixed0x168"
    "fixed0x176" "fixed0x184" "fixed0x192" "fixed0x200" "fixed0x208" "fixed0x216"
    "fixed0x224" "fixed0x232" "fixed0x240" "fixed0x248" "fixed0x256" "ufixed"
    "ufixed0x8" "ufixed0x16" "ufixed0x24" "ufixed0x32" "ufixed0x40" "ufixed0x48"
    "ufixed0x56" "ufixed0x64" "ufixed0x72" "ufixed0x80" "ufixed0x88" "ufixed0x96"
    "ufixed0x104" "ufixed0x112" "ufixed0x120" "ufixed0x128" "ufixed0x136"
    "ufixed0x144" "ufixed0x152" "ufixed0x160" "ufixed0x168" "ufixed0x176"
    "ufixed0x184" "ufixed0x192" "ufixed0x200" "ufixed0x208" "ufixed0x216"
    "ufixed0x224" "ufixed0x232" "ufixed0x240" "ufixed0x248" "ufixed0x256")
  "Solidity built-in types.")

(defconst hpb-solidity-constants
  '("true" "false" "wei" "gwei" "ether" "seconds" "minutes" "hours" "days" "weeks" "years")
  "Solidity constants.")

(defconst hpb-solidity-modifiers
  '("pure" "view" "payable" "constant" "anonymous" "indexed" "storage" "memory" "calldata")
  "Solidity modifiers.")

;;; Regular expressions for syntax highlighting

(defconst hpb-solidity-contract-regexp
  "\\(contract\\|interface\\|library\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching contract declarations.")

(defconst hpb-solidity-error-regexp
  "\\(error\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching error declarations.")

(defconst hpb-solidity-event-regexp
  "\\(event\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching event declarations.")

(defconst hpb-solidity-modifier-regexp
  "\\(modifier\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching modifier declarations.")

(defconst hpb-solidity-function-regexp
  "\\(function\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching function declarations.")

(defconst hpb-solidity-struct-regexp
  "\\(struct\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching struct declarations.")

(defconst hpb-solidity-test-function-regexp
  "\\(function\\)[ \t]+\\(test[A-Z_$][a-zA-Z0-9_$]*\\)"
  "Regexp for matching test function declarations.")

(defconst hpb-solidity-natspec-tag-regexp
  "\\(@[a-zA-Z]+\\)\\([ \t]+\\)\\([a-zA-Z0-9_$]+\\)?"
  "Regexp for matching NatSpec tags and parameter names.")

;;; Font-lock keywords

(defconst hpb-solidity-font-lock-keywords
  (list
   ;; Keywords
   `(,(regexp-opt hpb-solidity-keywords 'words) . font-lock-keyword-face)

   ;; Types
   `(,(regexp-opt hpb-solidity-builtin-types 'words) . font-lock-type-face)

   ;; Constants
   `(,(regexp-opt hpb-solidity-constants 'words) . font-lock-constant-face)

   ;; Modifiers
   `(,(regexp-opt hpb-solidity-modifiers 'words) . font-lock-builtin-face)

   ;; Contract, error, event, modifier, function, and struct declarations
   `(,hpb-solidity-contract-regexp (2 'hpb-solidity-contract-name-face))
   `(,hpb-solidity-error-regexp (2 'hpb-solidity-error-name-face))
   `(,hpb-solidity-event-regexp (2 'hpb-solidity-event-name-face))
   `(,hpb-solidity-modifier-regexp (2 'hpb-solidity-modifier-name-face))
   `(,hpb-solidity-function-regexp (2 'hpb-solidity-function-name-face))
   `(,hpb-solidity-struct-regexp (2 'hpb-solidity-struct-name-face))

   ;; Test functions
   `(,hpb-solidity-test-function-regexp (2 'hpb-solidity-test-function-name-face))

   ;; NatSpec tags
   `(,hpb-solidity-natspec-tag-regexp
     (1 font-lock-doc-face)
     (3 'hpb-solidity-natspec-param-name-face nil t))
   )
  "Font-lock keywords for `hpb-solidity-mode'.")

;;; Indentation

(defun hpb-solidity-indent-line ()
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
                    (+ (current-indentation) hpb-solidity-indent-level)
                  (let ((start-of-line-pos (line-beginning-position)))
                    (skip-chars-backward " \t\n")
                    (if (and (looking-back ";" (- (point) 1))
                             (not (> (nth 0 state) 0)))
                        (current-indentation)
                      (if (looking-at "}")
                          (- (current-indentation) hpb-solidity-indent-level)
                        (current-indentation))))))))))
         )
    ;; Indent the line
    (if (< (current-column) (current-indentation))
        (indent-line-to indent-col)
      (save-excursion (indent-line-to indent-col)))
    
    ;; If we were at the beginning of the line, move to the first non-whitespace character
    (when was-beginning-of-line
      (back-to-indentation))))

  ;; "Indent current line as Solidity code."
  ;; (interactive)
  ;; (let ((savep (> (current-column) (current-indentation)))
  ;;       (indent (condition-case nil
  ;;                   (max (hpb-solidity-calculate-indentation) 0)
  ;;                 (error 0))))
  ;;   (if savep
  ;;       (save-excursion (indent-line-to indent))
  ;;     (indent-line-to indent))))

(defun hpb-solidity-calculate-indentation ()
  "Calculate the indentation for the current line."
  (save-excursion
    (beginning-of-line)
    (cond
     ;; Inside documentation comment with '*' continuation
     ((and (looking-at "^[ \t]*\\*")
           (save-excursion
             (while (and (not (bobp))
                         (forward-line -1)
                         (looking-at "^[ \t]*$")))
             (looking-at "^[ \t]*/\\*\\*")))
      (save-excursion
        (forward-line -1)
        (while (and (not (bobp))
                    (looking-at "^[ \t]*$"))
          (forward-line -1))
        (if (looking-at "^[ \t]*/\\*\\*")
            (current-indentation)
          (+ (current-indentation) 1))))

     ;; Inside '///' documentation comment
     ((and (looking-at "^[ \t]*///")
           (save-excursion
             (forward-line -1)
             (looking-at "^[ \t]*///")))
      (save-excursion
        (forward-line -1)
        (current-indentation)))

     ;; Closing brace
     ((looking-at "^[ \t]*}")
      (save-excursion
        (let ((level 0))
          (while (and (>= level 0) (not (bobp)))
            (if (looking-at "^[ \t]*}")
                (setq level (1+ level))
              (when (looking-at "^[ \t]*{")
                (setq level (1- level))))
            (forward-line -1))
        (current-indentation))))

     ;; Default indentation logic
     (t
      (let ((level 0))
        (save-excursion
          (beginning-of-line)
          ;; Previous non-blank line's indentation
          (when (not (bobp))
            (forward-line -1)
            (while (and (not (bobp)) (looking-at "^[ \t]*$"))
              (forward-line -1))
            (setq level (current-indentation))

            ;; Check for opening braces
            (when (looking-at ".*{[ \t]*$")
              (setq level (+ level hpb-solidity-indent-level)))

            ;; Check for closing braces on this line
            (when (looking-at "^[ \t]*}")
              (setq level (- level hpb-solidity-indent-level)))

            ;; Check for special cases like if, for, while without braces
            (when (and (looking-at "^[ \t]*\\(if\\|for\\|while\\|else\\).*[^{][ \t]*$")
                       (not (looking-at ".*}[ \t]*$")))
              (setq level (+ level hpb-solidity-indent-level)))))
        level)))))

;;; Outline mode integration

(defun hpb-solidity-outline-level ()
  "Return the depth to which a statement is nested in the outline."
  (save-excursion
    (skip-chars-forward " \t")
    (current-column)))

(defconst hpb-solidity-outline-regexp
  "^[ \t]*\\(contract\\|interface\\|library\\|struct\\|error\\|event\\|modifier\\|function\\)\\|^[ \t]*/[/*]\\|^[ \t]*{\\|^[ \t]*}"
  "Regexp identifying Solidity outline headings.")

;;; Documentation jump functionality

(defvar-local hpb-solidity-jump-position nil
  "Position to jump back to after documentation jump.")

(defun hpb-solidity-jump-to-doc (arg)
  "Jump to corresponding documentation for the entity at point.
With universal argument ARG, jump back to the previous position."
  (interactive "P")
  (if arg
      (when hpb-solidity-jump-position
        (goto-char hpb-solidity-jump-position)
        (setq hpb-solidity-jump-position nil))
    (let ((current-pos (point))
          (identifier (thing-at-point 'symbol)))
      (when identifier
        (save-excursion
          ;; Find the start of the function/contract/etc.
          (beginning-of-line)
          (while (and (not (bobp))
                      (not (looking-at (concat "^[ \t]*\\(function\\|modifier\\|contract\\|interface\\|library\\|error\\|event\\|struct\\)[ \t]+" (regexp-quote identifier)))))
            (forward-line -1))

          (when (looking-at (concat "^[ \t]*\\(function\\|modifier\\|contract\\|interface\\|library\\|error\\|event\\|struct\\)[ \t]+" (regexp-quote identifier)))
            (setq hpb-solidity-jump-position current-pos)
            ;; Look for documentation above
            (let ((doc-found nil))
              (save-excursion
                (forward-line -1)
                (while (and (not (bobp))
                            (or (looking-at "^[ \t]*$")
                                (looking-at "^[ \t]*//")))
                  (when (looking-at "^[ \t]*///\\|^[ \t]*/\\*\\*")
                    (setq doc-found t))
                  (forward-line -1)))

              (if doc-found
                  ;; Go to the documentation
                  (progn
                    (forward-line -1)
                    (while (and (not (bobp))
                                (or (looking-at "^[ \t]*$")
                                    (not (looking-at "^[ \t]*///\\|^[ \t]*/\\*\\*"))))
                      (forward-line -1))
                    (when (looking-at "^[ \t]*/\\*\\*")
                      (forward-line 1)
                      (beginning-of-line)))

                ;; No documentation found, create template
                (forward-line -1)
                (end-of-line)
                (insert "\n")
                (let ((doc-template (hpb-solidity-generate-doc-template identifier)))
                  (insert doc-template))))))))))

(defun hpb-solidity-generate-doc-template (identifier)
  "Generate documentation template for IDENTIFIER."
  (let ((doc-style "///")
        (template ""))
    (setq template (concat doc-style " @title " identifier "\n"))
    (setq template (concat template doc-style " @dev \n"))
    template))

;;; Comment functionality

(defun hpb-solidity-comment-dwim (arg)
  "Comment or uncomment current line or region.
Argument ARG is passed to `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let ((comment-start "// ")
        (comment-end ""))
    (comment-dwim arg)))

(defun hpb-solidity-insert-doc-comment ()
  "Insert a documentation comment."
  (interactive)
  (let ((doc-style "///"))
    (beginning-of-line)
    (if (looking-at "^[ \t]*$")
        (delete-horizontal-space))
    (insert doc-style " ")
    (end-of-line)))

;;; Imenu integration

(defvar hpb-solidity-imenu-generic-expression
  `(
    ;; Contracts, interfaces, libraries
    ("Contracts" "^[ \t]*\\(\\(?:abstract[ \t]+\\)?contract\\|interface\\|library\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 2)

    ;; Variables
    ("Variables" "^[ \t]*\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)[ \t]*[;=]" 2
     (lambda (name)
       (not (member (match-string-no-properties 1) hpb-solidity-keywords))))

    ;; Structs
    ("Structs" "^[ \t]*struct[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 1)

    ;; Errors
    ("Errors" "^[ \t]*error[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 1)

    ;; Events
    ("Events" "^[ \t]*event[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 1)

    ;; Modifiers
    ("Modifiers" "^[ \t]*modifier[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 1)

    ;; Functions
    ("Functions" "^[ \t]*function[ \t]+\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)" 1)
    )
  "Imenu expression for Solidity mode.")

(defun hpb-solidity-imenu-create-index ()
  "Create an imenu index for Solidity files using generic expressions."
  (let ((imenu-generic-expression hpb-solidity-imenu-generic-expression)
        ;; Prevent sorting alphabetically
        (imenu-sort-function 'imenu--sort-by-name))
    (imenu--generic-function hpb-solidity-imenu-generic-expression)))

;;; Mode definition

;;;###autoload
(define-derived-mode hpb-solidity-mode c-mode "Solidity"
  "Major mode for editing Solidity code."
  :syntax-table hpb-solidity-mode-syntax-table

  ;; Comments
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (setq-local comment-start-skip "//+\\|/\\*+\\s-*")

  ;; Indentation
  (setq-local indent-line-function 'hpb-solidity-indent-line)

  ;; Font-lock
  (setq-local font-lock-defaults '(hpb-solidity-font-lock-keywords))

  ;; Outline mode
  (setq-local outline-regexp hpb-solidity-outline-regexp)
  (setq-local outline-level 'hpb-solidity-outline-level)

  ;; Imenu
  (setq-local imenu-create-index-function 'hpb-solidity-imenu-create-index)

  ;; Enable outline-minor-mode
  (outline-minor-mode 1)

  ;; Enable subword-mode
  (subword-mode 1)

  ;; Set up keymap
  (let ((map hpb-solidity-mode-map))
    (define-key map (kbd "C-c C-j") 'hpb-solidity-jump-to-doc)
    (define-key map (kbd "C-c C-c") 'hpb-solidity-comment-dwim)
    (define-key map (kbd "C-c C-d") 'hpb-solidity-insert-doc-comment))

  ;; Run hooks
  (run-hooks 'hpb-solidity-mode-hook))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sol\\'" . hpb-solidity-mode))

(provide 'hpb-solidity-mode)
;;; hpb-solidity-mode.el ends here
