" betterfind.vim - A Better Vim find command
" Maintainer:   Siddeshwar 
" Version:      1.0

if !exists("g:betterfind_map_keys")
    let g:betterfind_map_keys = 1
endif

set path=**
set wildmenu
set wildignore+=*.o,*.d,*.so,*.a,*.elf,*.bin,*.out,*.map,*.gcda,*.gcno,*.s,*.i,*.lst,*.bak,*.swp,*.tmp,*~
set wildoptions=pum

function! s:GitFilesFind(A, L, P) abort
    if system("git rev-parse --is-inside-work-tree") =~? "^true"
        let l:files = split(system("git ls-files"), "\n")
        let l:filtered = filter(l:files, "v:val =~ a:A")
        return l:filtered
    else
        echoerr "Not inside a Git repository"
        return []
    endif
endfunction

command! -nargs=1 -complete=customlist,s:GitFilesFind GFind execute "find" <q-args>
command! -nargs=1 -complete=customlist,s:GitFilesFind Gf execute "find" <q-args>

if g:betterfind_map_keys
    nnoremap <leader>ff :find<space>
    nnoremap <leader>fg :GFind<space>
endif
