;;; config.el --- super-save layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Mario Mainz & Contributors
;;
;; Author: Mario Mainz <mainz.mario@googlemail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defgroup super-save nil
  "Smart-saving of buffers."
  :group 'tools
  :group 'convenience)

(defcustom super-save-triggers
  '("switch-to-buffer"
    "other-window"
    "delete-window"
    "windmove-up"
    "windmove-down"
    "windmove-left"
    "windmove-right"
    "evil-window-up"
    "evil-window-down"
    "evil-window-left"
    "evil-window-right"
    "select-window-by-number"
    "select-window-0"
    "select-window-1"
    "select-window-2"
    "select-window-3"
    "select-window-4"
    "select-window-5"
    "select-window-6"
    "select-window-7"
    "select-window-8"
    "select-window-9")
  "A list of commands which would trigger `super-save-command'."
  :group 'super-save
  :type '(repeat string))

;;; config.el ends here
