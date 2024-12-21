" agile.vim
" Author:   Siddeshwar <siddeshwar.work@gmail.com>
" Version:  1.0

if exists("g:loaded_agile")
  finish
endif
let g:loaded_agile = 1

if !exists("g:agile_last_edit")
  let g:agile_last_edit = 1
endif

if !exists("g:agile_last_edit_mark")
  let g:agile_last_edit_mark = 'Z'
endif

let g:netrw_banner = 0
let g:netrw_list_hide = '^\..*'

nnoremap - :Explore<CR>

set path=**
set wildmenu
set wildignore+="*.o,*.d,*.so,*.a,*.elf,*.bin,*.out,*.map,*.gcda,*.gcno,*.s
set wildignore+=*.i,*.lst,*.bak,*.swp,*.tmp,*~"
set wildoptions=pum
set wildmode=longest:full,full

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

function! s:Grep(search_term)
  if executable('rg')
    let l:grepprg = 'rg --vimgrep'
  else
    let l:grepprg = 'grep -nH'
  endif

  let l:original_grepprg = &grepprg
  let &grepprg = l:grepprg
  execute 'grep! ' . a:search_term
  let &grepprg = l:original_grepprg

  copen
endfunction

function! s:LastEdit()
  if getpos("'" . g:agile_last_edit_mark)[1] == 0
    echo "No last edit location found"
    return
  endif

  execute 'normal! g`' . g:agile_last_edit_mark
endfunction

if g:agile_last_edit
  augroup agile_last_edit
    autocmd!
    autocmd BufWritePost * execute 'normal! m' . g:agile_last_edit_mark
  augroup END

  command! LastEdit call s:LastEdit()
endif

command! -nargs=1 -complete=customlist,s:GitFilesFind Gfind execute "find"
            \<q-args>
command! -nargs=1 Grep call s:Grep(<q-args>)
