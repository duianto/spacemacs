;;; funcs.el --- super-save layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Mario Mainz & Contributors
;;
;; Author: Mario Mainz <mainz.mario@googlemail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun super-save-command ()
  "Save the current buffer if needed."
  (when (and buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defun super-save-command-advice (&rest args)
  "A simple wrapper around `super-save-command' that's advice-friendly."
  (super-save-command))

(defun super-save-advise-trigger-commands ()
  "Apply super-save advice to the commands listed in `super-save-triggers'."
  (mapc (lambda (command)
          (advice-add (intern command) :before #'super-save-command-advice))
        super-save-triggers))

(defun super-save-remove-advice-from-trigger-commands ()
  "Remove super-save advice from to the commands listed in `super-save-triggers'."
  (mapc (lambda (command)
          (advice-remove (intern command) #'super-save-command-advice))
        super-save-triggers))

(defun super-save-initialize ()
  "Setup super-save's advices and hooks."
  (super-save-advise-trigger-commands)
  (add-hook 'mouse-leave-buffer-hook #'super-save-command)
  (add-hook 'focus-out-hook #'super-save-command))

(defun super-save-stop ()
  "Cleanup super-save's advices and hooks."
  (super-save-remove-advice-from-trigger-commands)
  (remove-hook 'mouse-leave-buffer-hook #'super-save-command)
  (remove-hook 'focus-out-hook #'super-save-command))

(define-minor-mode super-save-mode
  "A minor mode that saves your Emacs buffers when they lose focus."
  :group 'super-save
  :global t
  (cond
   (super-save-mode (super-save-initialize))
   (t (super-save-stop))))
