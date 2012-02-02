" Enable file type detection
syntax	on									" syntax highlighting
filetype plugin on 					" try to detect the filetype
filetype plugin indent on 	" enable loading indent file for filetype 

" Hide osx toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" PATHOGEN
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" GIT
nmap <leader>ga :Gwrite<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>grm :Gremove<cr>
nmap <leader>gmv :Gmove<cr>
nmap <leader>gc :Gcommit<cr>

" MINIBUFEXPOLORER
map <silent> <D-r> :MiniBufExplorer<cr>/
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" COMMAND T 
let g:CommandTMaxHeight=30
let g:CommandTMatchWindowAtTop=1
set wildignore+=*.pyc,*.obj,.git,data/*,build/*,*.html.py

" TAGBAR - show tags of current file in sidebar
let g:tagbar_usearrows = 1
nmap <C-e> :TagbarToggle<CR>

" GUNDO pane toggle
nmap <C-u> :GundoToggle<CR>

" AUTO COMPLETE
" set ofu=syntaxcomplete#Complete
"map! <silent> <D-Space> <C-x><C-o>
let g:SuperTabDefaultCompletionType = "context"
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

" ACK
nmap <S-f> :<Esc>:Ack!<CR>
nmap <D-3> :<Esc>:Ack!<CR>

" ROPE
" nmap <C-r> :<Esc>:RopeCodeAssist<CR>
nmap <D-4> <Esc>:RopeShowDoc<CR>
map <D-4> <Esc>:RopeShowDoc<CR>
nmap <D-5> <Esc>:RopeShowCalltip<CR>
map <D-5> <Esc>:RopeShowCalltip<CR>
nmap <D-g> <Esc>:RopeGotoDefinition<CR>

map <leader>rg :RopeGotoDefinition<CR>
map <leader>rd :RopeShowDoc<CR>
map <leader>rt :RopeShowCalltip<CR>


" STATUS LINE
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c 

function! CurDir()
	let curdir = substitute(getcwd(), '/Users/tony/', "~/", "g")
  return curdir
endfunction

function! HasPaste()
  if &paste
	  return 'PASTE MODE  '
  else
    return ''
  endif
endfunction



" PYTHON
"let python_highlight_all=1
set completeopt=menuone,longest,preview
au FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python map <buffer> <S-e> :w<CR>:!/usr/local/Cellar/python/2.6.4/bin/python % <CR>
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

" INI & CNF
autocmd BufNewFile,BufRead *.ini setfiletype ini
autocmd BufNewFile,BufRead *.cnf setfiletype ini
autocmd BufNewFile,BufRead *.gitignore setfiletype ini

" HTML - tag auto completion
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" THEME 
set background=dark
colorscheme blackboard 
set number
set visualbell
set title
set wildmenu
set scrolloff=8
set cursorline
set incsearch
set shortmess=aOstT
set showcmd
set sidescrolloff=8

" save all files when focus is lost
au FocusLost * :wa

" reset leader and do fast timeouts
set timeoutlen=500
let mapleader = ","

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" folding based on indentation:
set foldmethod=indent
set foldlevel=99
"set nofoldenable

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.


set nowrap
" when set,is set, hitting Tab in insert mode will produce the appropriate number of spaces.
" expandtab
"
""set textwidth=79
" This determines how many columns a tab counts as. 
set tabstop=2
"set softtabstop=4
"set shiftwidth=2
set autoindent


" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

" Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Markdown
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.mkd  setfiletype mkd
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  setfiletype mkd

" execute current buffer with interperator"
autocmd FileType haskell map <buffer> <S-h> :w<CR>:!ghc %<CR>





" Better way to cycle through window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Textmate like indentation mappers
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv



" fix command typos
nmap ; :


" space / shift-space paging
noremap <S-space> <C-b>
noremap <space> <C-f>

" Make Arrow Keys Useful Again 
map <down> <ESC>:bn<RETURN>
map <left> <ESC>:tabprevious<RETURN>
map <right> <ESC>:tabnext<RETURN>
map <up> <ESC>:bp<RETURN>
map <S-Tab> <ESC>:tabnew<RETURN>:CommandT<CR>

"enter insert mode with 'gi' exits when enter pressed"
autocmd! InsertLeave * silent! iunmap <CR>
nnoremap gi :inoremap <C-V><CR> <C-V><ESC><CR>i

"map control-enter behavior"
map! <silent> <D-Enter> <ESC>o

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" auto-reload vimrc file on changes
" autocmd BufWritePost ~/.vimrc so %
