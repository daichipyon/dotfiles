if exists('b:did_ftplugin_javascript')
    finish
endif
let b:did_ftplugin_javascript = 1

" Google JavaScript style guide
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

"syntax and indent
NeoBundleSource vim-javascript

