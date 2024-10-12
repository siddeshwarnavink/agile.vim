" betterfind.vim - A Better Vim find command
" Maintainer:   Siddeshwar 
" Version:      1.0

if !exists("g:betterfind_map_keys")
    let g:betterfind_map_keys = 1
endif

set path=**
set wildmenu
set wildignore+="*.o,*.d,*.so,*.a,*.elf,*.bin,*.out,*.map,*.gcda,*.gcno,*.s
set wildignore+=*.i,*.lst,*.bak,*.swp,*.tmp,*~"
set wildoptions=pum

function! s:GitFilesFind(A, L, P) abort
    if system("git rev-parse --is-inside-work-tree") =~? "^true"
        let l:filepaths = split(system("git ls-files \"*" . a:A . "*\""), "\n")
        let l:files = map(l:filepaths, {x, val -> split(val, "/")[-1]})

        return l:files 
    else
        echoerr "Not inside a Git repository"
        return []
    endif
endfunction

command! -nargs=1 -complete=customlist,s:GitFilesFind GFind execute "find"
            \<q-args>
command! -nargs=1 -complete=customlist,s:GitFilesFind Gf execute "find" 
            \<q-args>

if g:betterfind_map_keys
    nnoremap ff :find<space>
    nnoremap fg :GFind<space>
endif
