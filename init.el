(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)
;(server-start)
(setq inhibit-startup-screen t); this will prevent the start up menu
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(require 'latex-pretty-symbols)
(require 'magic-latex-buffer)
(add-hook 'TeX-mode-hook 'magic-latex-buffer)
(add-hook 'TeX-mode-hook 'flyspell-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
  TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-mode t)
; (add-hook 'LaTeX-mode-hook (lambda ()
			     
;; 			     (rainbow-delimiters-mode)
;; 			     (company-mode)
;; 			     (smartparens-mode)
;; 			     (turn-on-reftex)
;; 			     (setq reftex-plug-into-AUCTeX t)
; 			     (reftex-isearch-minor-mode)
 			     
;; 			     (fly-spell-mode)
;; 			     (LaTeX-math-mode)
;; 			     (visual-line-mode)
;; 			     (setq ispell-dictionary "english")
;; 			     (setq TeX-parse-self t); Enable parse on load.
 			     
;; 			     (setq TeX-source-correlate-start-server t)
 			     
 			      	  ; TeX-source-correlate-start-server t) 
 			     ;; (setq TeX-auto-save t); Enable parse on save.))
;))

;; (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;;            #'TeX-revert-document-buffer)






;; (setq TeX-raise-frame-function #'x-focus-frame)



;; (setq-default TeX-master nil)
;; (add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;; (add-hook 'TeX-mode-hook 'visual-line-mode)


;; (add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
;; (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
;; (add-hook 'TeX-mode-hook
;;           (lambda () (TeX-fold-mode 1)));
;; (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
;; ;(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; ;; Use pdf-tools to open PDF files
;; ;(setq TeX-source-correlate-method '((pdf . synctex)))
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;       TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
;;       TeX-source-correlate-start-server t)
;; (setq Tex-source-correlate-mode t)
;; ;; Update PDF buffers after successful LaTeX runs
;; (add-hook 'TeX-after-compilation-finished-functions
;;            #'TeX-revert-document-buffer)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages (quote (shackle pdf-tools))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; (use-package tex-site
;;   :ensure auctex
;;   :mode ("\\.tex\\'" . latex-mode)
;;   :config
;;   (setq TeX-auto-save t)
;;   (setq TeX-parse-self t)
;;   (setq-default TeX-master nil)
;;   (add-hook 'LaTeX-mode-hook
;;             (lambda ()
;;               (rainbow-delimiters-mode)
;;               (company-mode)
;;               (smartparens-mode)
;;               (turn-on-reftex)
;;               (setq reftex-plug-into-AUCTeX t)
;;               (reftex-isearch-minor-mode)
;;               (setq TeX-PDF-mode t)
;;               (setq TeX-source-correlate-method 'synctex)
;;               (setq TeX-source-correlate-start-server t)))

;; ;; Update PDF buffers after successful LaTeX runs
;; (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;;            #'TeX-revert-document-buffer)


;; ;; to use pdfview with auctex
;; ;(add-hook 'LaTeX-mode-hook 'pdf-tools-install)

;; ;; to use pdfview with auctex
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
;;        TeX-source-correlate-start-server t))

;; (use-package reftex
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq reftex-cite-prompt-optional-args t)); Prompt for empty optional arguments in cite

;; (use-package ivy-bibtex
;;   :ensure t
;;   :bind ("C-c b b" . ivy-bibtex)
;;   :config
;;   (setq bibtex-completion-bibliography 
;;         '("C:/Users/Nasser/OneDrive/Bibliography/references-zot.bib"))
;;   (setq bibtex-completion-library-path 
;;         '("C:/Users/Nasser/OneDrive/Bibliography/references-pdf"
;;           "C:/Users/Nasser/OneDrive/Bibliography/references-etc"))

;;   ;; using bibtex path reference to pdf file
;;   (setq bibtex-completion-pdf-field "File")

;;   ;;open pdf with external viwer foxit
;;   (setq bibtex-completion-pdf-open-function
;;         (lambda (fpath)
;;           (call-process "C:\\Program Files (x86)\\Foxit Software\\Foxit Reader\\FoxitReader.exe" nil 0 nil fpath)))

;;   (setq ivy-bibtex-default-action 'bibtex-completion-insert-citation))

;; (use-package pdf-tools
;;   :ensure t
;;   :mode ("\\.pdf\\'" . pdf-tools-install)
;;   :bind ("C-c C-g" . pdf-sync-forward-search)
;;   :defer t
;;   :config
;;   (setq mouse-wheel-follow-mouse t)
;;   (setq pdf-view-resize-factor 1.10))

 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magic-latex-buffer latex-pretty-symbols pdf-tools))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )