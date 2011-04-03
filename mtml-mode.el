(defvar mtml-font-lock-keywords
  (list
    (list "\\(<[\\$/]?mt:?\\)\\([-a-zA-Z0-9:_]+\\)\\([ \n][ \n]*\\([ \n]*?\\([-a-zA-Z0-9:_]+?\\) *\\(=\\) *\\(<[^>]+?>\\|\"\\(<[^>]+?>\\|.\\)*?\"\\|'\\(<[^>]+?>\\|.\\)*?'\\|.\\)[ \n]*?\\)*?\\)?\\([-\\$/]*?>\\)"
      '(1 font-lock-string-face nil t)
      '(2 font-lock-keyword-face nil t)
      '(10 font-lock-string-face nil t)
      '("\\([-a-zA-Z0-9:_]+?\\) *\\(=\\) *\\(<[^>]+?>\\|\"\\(<[^>]+?>\\|[^\"]\\)*?\"\\|'\\(<[^>]+?>\\|[^']\\)*?'\\)"  ;ANCHORED
        (progn
          (goto-char (match-end 2))
          (match-end 0))
        nil
        (1 font-lock-function-name-face t)
        (2 font-lock-string-face t)
        (3 font-lock-type-face t)))
    (list "\\(<mt:ignore>\\(\n\\|.\\)*?</mt:ignore>\\)"
      '(1 font-lock-comment-face t t)))
  "Additional expressions to highlight in MTML mode.")

(defun mtml-mode ()
  (interactive)
  (setq major-mode 'mtml-mode
    mode-name "MTML mode")
  (defvar mtml-mode-syntax-table nil
    "Syntax table used while in mtml mode.")
  (if mtml-mode-syntax-table
    ()
    (setq mtml-mode-syntax-table (make-syntax-table)))
  (set (make-local-variable 'font-lock-defaults)
    '(mtml-font-lock-keywords t t))
  (run-hooks 'mtml-mode-hook)
)
(provide 'mtml-mode)
