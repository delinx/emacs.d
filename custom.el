;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5244ba0273a952a536e07abaad1fdf7c90d7ebb3647f36269c23bfd1cf20b0b8"
     "b99ff6bfa13f0273ff8d0d0fd17cc44fab71dfdc293c7a8528280e690f084ef0"
     "6aff83667a3bad8db2f55d69cf595f58b56af233f116ec24d93fe2aa51033eef"
     "5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
     "7d3668feddab2768da5059c7cee3d4f2fa9bcd7524825d182f5991a756893d86"
     "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
     "7c3d62a64bafb2cc95cd2de70f7e4446de85e40098ad314ba2291fc07501b70c"
     "3613617b9953c22fe46ef2b593a2e5bc79ef3cc88770602e7e569bbd71de113b"
     "7dd212c10ac235c6dfa3130498f8184fcbaf4aa19fe058034896839bd0d8bb8e"
     "b237054fec3300798462c2a2d154dd0f549f64f8ffd6a0e010236d3a7f3e2b37"
     "ec80b4f76799935148cfe295117542ba357134a1f763965860d86ef2082edf60"
     "2198a9a3fa0b04c2768cbdb7634aa821285341101079cc8ee0efe6417f1137a7"
     "236477d4c2a342ff71347a4bb02b078ddfff4c1c400d56423cc3c286f73c2fd2"
     "95ec3450fd30bd09acdf81d40d341c592020c34d10b647d20d0efdf61ab19fb4"
     "435b7381cf466ba292e83e9825a80b5a0378b47106201a2afa04f4610730deb5"
     "5b3209ebeb59d13f5430fcc3f5561f5e096cf6f8906a41588183a35c80a81398"
     "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695"
     "c7aa0221a18bd9489b4bcd9b81f736244a4b666321ea352c08349cbe4270fc5f"
     "aa372e73687b58e5d85de99562be2c59652b9f1eacfcf416898e689466b4fc0e"
     "049ab81c3b5a693bcebefb3dcb58f6d661b936f819b63f01cf22ed3e5eacb989"
     "2443d043f1f39a896b13912f608a8af5994f135aca86ce7954996104ee78a61a"
     "ab0ad3ff547fc8a0d808cac417bd3df99963c5f0f8b58d4e26d043f5fd1c41c8"
     "d7c7b5b3bf70ab6cd1c02a5ae176cf971b8c9b8ad118a82ee3459f93a6bda13e"
     "249138cdfc2bbc0bf35d03728b51c9320e6db4669caf0b24b04a6cf4157bb050"
     "e9e28182669917b3b8aa4fe7f55577b982cac1ad3141269b447c721af663f3e0"
     "4fea1174a6eaba952c2c61cfbe4ec9aef5c81836d84a4b16149f3d97e8bae022"
     "b3ed1a4cf401a667d2ec3d8d62eb2062db0476f8c8990d8be8483deac7431c58"
     "fbc920c37a0eabb2048ae983fce1a4e606c647b647f98d45e61038f23dc01416"
     "01dd8191b477f6270872112066775a76ff0003c4b65d94b8df0cbdc25c4e135b"
     "14b18b984aae4bd6045b6e043d0c8ae9c1e1202f58f627bbaa1ce04aec9bb4fe"
     "6efc6ba78594ab1083719e96505257474ac24b34ae87c0f89a35211359bcdc49"
     "3a501c554d57378e12db9c2f1583153729a481990235dc3aeace9d3253c1b76e"
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
 '(package-selected-packages
   '(boon centaur-tabs consult corfu deadgrep doom-modeline doom-themes ef-themes eglot-booster evil-collection gcmh
          hotfuzz iflipb jai-mode ligature magit marginalia meow nerd-icons-completion nerd-icons-corfu nord-theme
          orderless popper rainbow-mode smartparens tree-sitter-langs treemacs-evil treemacs-nerd-icons
          treemacs-projectile treesit-auto vertico))
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
