;;; packages.el --- super-save layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Mario Mainz & Contributors
;;
;; Author: Mario Mainz <mainz.mario@googlemail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst super-save-packages
  '(
    super-save
    window-numbering
    ))

(defun super-save/init-super-save ()
  (super-save-initialize))

(defun super-save/post-init-window-numbering ()
  (super-save-mode +1))

;;; packages.el ends here
