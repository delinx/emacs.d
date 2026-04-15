;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3a501c554d57378e12db9c2f1583153729a481990235dc3aeace9d3253c1b76e"
     "11a62d18b348a11e8ff8e300b0a747a35af49dbf591ff14e05755c6eb9fc3e3d"
     "f77c771de2cf29bac4b3fe1e104d3e8585b34655415f0fdc399f2e89780fd007"
     "480d7223916d9e47e281def1b78c1c2a9baadaa36382486d7b8e071191d0edf3"
     "32122f04ac5abb2d10b49253a42951873a2e29eb1bd76695776480c047e3cf91"
     "b7db366d782e056a885fca6e04ef4fbaf6ff2cf5755cb0f9ea1ff785a412a2e2"
     "8def4ac6a5dd13bf5b517d6b3e06fc50514c70e9de8790a9ae13186f4d0c0ca4"
     "6ddaeea08233be355830cd181d52b53a6955dcb14c697a845b68bf2b6e38dab4"
     "4b919e99615d3537aa90bad5dcda7ce83fd3754f45bb09403b2b598969b2d82d"
     "8bc88908a21c653559003cc87a3a5801131fbf90937b6d9d9c332cf4d4138d21"
     "43ca64f8b46fef61f7fe0a66183de858311f4a95d97cc07893d815323d5c38b3"
     "6ec1318b4c1948791936ecf2af30c0345aae61a36605b84174b5a617429f2e0f" default))
 '(package-selected-packages nil)
 '(safe-local-variable-values
   '((eval progn
           (defun my/deadgrep-add-jai-path (args)
             (if (string-prefix-p "A:/Projects/uST01_j" default-directory) (append args (list "A:/jai")) args))
           (advice-add 'deadgrep--arguments :filter-return #'my/deadgrep-add-jai-path))
     (deadgrep-extra-arguments "A:/jai"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
