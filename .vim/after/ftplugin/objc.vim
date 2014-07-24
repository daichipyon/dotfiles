if exists('b:did_ftplugin_objc')
    finish
endif
let b:did_ftplugin_objc = 1

setlocal tabstop=2 softtabstop=2 shiftwidth=2

let g:clang_auto_user_options = 'path, .clang_complete, ios'
let g:clang_complete_getopts_ios_ignore_directories = ["^\.git",  "\.xcodeproj"]
