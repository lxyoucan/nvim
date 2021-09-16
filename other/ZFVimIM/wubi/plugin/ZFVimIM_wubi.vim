let g:ZFVimIM_keymap = 0

"nnoremap <expr><silent> ;; ZFVimIME_keymap_toggle_n()
inoremap <expr><silent> ;; ZFVimIME_keymap_toggle_i()
"vnoremap <expr><silent> ;; ZFVimIME_keymap_toggle_v()

"nnoremap <expr><silent> ;: ZFVimIME_keymap_next_n()
inoremap <expr><silent> ;: ZFVimIME_keymap_next_i()
"vnoremap <expr><silent> ;: ZFVimIME_keymap_next_v()

"nnoremap <expr><silent> ;, ZFVimIME_keymap_add_n()
"inoremap <expr><silent> ;, ZFVimIME_keymap_add_i()
"xnoremap <expr><silent> ;, ZFVimIME_keymap_add_v()

"nnoremap <expr><silent> ;. ZFVimIME_keymap_remove_n()
"inoremap <expr><silent> ;. ZFVimIME_keymap_remove_i()
"xnoremap <expr><silent> ;. ZFVimIME_keymap_remove_v()



let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
	"五笔拼音
	let dbFile = '/misc/wubi_pinyin.txt'
    let dbCountFile = '/misc/wubi_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : '五笔',
                \ })
    call ZFVimIM_cloudRegister({
				\   'mode' : 'local',
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'dbId' : db['dbId'],
                \ })
endfunction

augroup ZFVimIM_wubi_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

