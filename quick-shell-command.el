(defvar quick-shell-command "" "Command that gets executed by quick-shell-command")

(defun quick-shell-command-set (&optional command)
  "Set command to be executed by quick-shell-command"
  (if (stringp command)
      (setq quick-shell-command command)
    (let ((def-value ""))
      (if (stringp quick-shell-command)
          (setq def-value quick-shell-command))
      (setq quick-shell-command (read-string "Command: " def-value)))))

(defun quick-shell-command (&optional prefix)
  "Run shell command"
  (interactive "P")
  (cond ((or prefix
             (not (stringp quick-shell-command))
             (equal quick-shell-command ""))
         (quick-shell-command-set)
         ))

  (save-buffer)
  (shell-command quick-shell-command))

(provide 'quick-shell-command)
