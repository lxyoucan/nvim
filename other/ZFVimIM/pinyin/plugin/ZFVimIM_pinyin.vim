let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/pinyin.txt'
    let dbCountFile = '/misc/pinyin_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : '拼音',
                \ })
    call ZFVimIM_cloudRegister({
				\   'mode' : 'local',
                \   'dbId' : db['dbId'],
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \ })
endfunction

augroup ZFVimIM_pinyin_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

