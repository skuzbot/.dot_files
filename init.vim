packadd minpac
" move swp files
set directory=~/.vim/backups

let mapleader = " "

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" theme
call minpac#add('tlhr/anderson.vim')
set termguicolors
colorscheme anderson

" git
call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
" nmap <leader>g :15split \| Gedit :<cr>
nmap <leader>gs :Gstatus<CR><C-w>14-
nmap <leader>gd :Gdiff<CR>
nmap <leader>gdd :Gdiff!<CR>

" tmux
call minpac#add('christoomey/vim-tmux-navigator')

" intellisense engine
call minpac#add('ervandew/supertab')
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabMappingForward = '<s-tab>'

call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
" ##########################################################
" coc configs
" ##########################################################
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ##########################################################

" elixir
call minpac#add('tpope/vim-endwise')
call minpac#add('elixir-editors/vim-elixir')
" call minpac#add('mhinz/vim-mix-format')
" let g:mix_format_on_save = 1

" folds
set viewoptions-=options
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" sql
" call minpac#add('tpope/vim-dadbod')
" let g:db_url = $DATABASE_URL
" nnoremap <leader>q :normal vip<CR>:%DB g:db_url<CR>

" js
" call minpac#add('yuezk/vim-js')
" call minpac#add('maxmellon/vim-jsx-pretty')

" html
call minpac#add('adelarsq/vim-matchit')
call minpac#add('turbio/bracey.vim')

" search
call minpac#add('liuchengxu/vim-clap')
let g:clap_layout = {'relative': 'editor'}
nnoremap <leader>p :Clap files<CR>
" call minpac#add('rking/ag.vim')
call minpac#add('mileszs/ack.vim')
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })

" ##########################################################
" statusline
" ##########################################################
" lightline
call minpac#add('itchyny/lightline.vim')
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
" \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ],
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ],
      \ },
      \ 'component': {
      \   'shadow': '█▓░ '
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" ##########################################################

" whitespace
call minpac#add('Yggdroot/indentLine')
let g:indentLine_char = '┆'
" set list listchars=tab:>-,trail:.,extends:>,precedes:<,space:·
" set listchars=space:·

" file navigation
call minpac#add('francoiscabrol/ranger.vim')
call minpac#add('tpope/vim-vinegar')

" bracket
call minpac#add('rbgrouleff/bclose.vim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('alvan/vim-closetag')
call minpac#add('Raimondi/delimitMate')

" autoclose tag settings
" let g:closetag_filenames = '*.html,*.js,*.jsx'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" commenting
call minpac#add('tomtom/tcomment_vim')

" zen
call minpac#add('junegunn/limelight.vim')
call minpac#add('junegunn/goyo.vim')

" snippets
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" smooth scrolling - doesn't seem to be working?
call minpac#add('terryma/vim-smooth-scroll')

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 1, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0.5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" linting
call minpac#add('w0rp/ale')
call minpac#add('maximbaz/lightline-ale')

" system clipboards
map <Leader>fy "*y expand('%')
map <Leader>y "*y
map <Leader>d "+d
map <Leader>p "+p
map <Leader>P "+P

" sort
vnoremap <C-s>  :'<,'>sort i<CR>

" :::::::::::::::::::: ??? ::::::::::::::::::::::::::::::::
" :::::::::::::::::::: ??? ::::::::::::::::::::::::::::::::

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set number
" set relativenumber
set incsearch
set hlsearch
set smartcase
set ignorecase
set nowrap


" ##########################################################
" vista configs
" ##########################################################
call minpac#add('liuchengxu/vista.vim')
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'
" ##########################################################


" autosave
call minpac#add('sjl/vitality.vim')
:au BufLeave,FocusLost,VimResized * silent! :wa
:set autowrite
let g:tmux_navigator_save_on_switch = 2

" ranger
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" highlights
set hlsearch
hi Search ctermfg=0
hi Search ctermbg=10

" whitespace
call minpac#add('ntpeters/vim-better-whitespace')
let g:better_whitespace_guicolor='bright_green'
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
" let g:strip_only_modified_lines=1

" mappings
" Get out of nvim terminal back to normal mode
:tnoremap <Esc> <C-\><C-n>

" vnoremap <c-q> :%DB g:db_url<CR>
" nnoremap <leader>s :DB g:db_url =
noremap <leader>lO :Vista<CR>
nnoremap <leader>/ :silent grep<space>
nmap <leader>ld <Plug>(coc-definition)zz
nnoremap <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
nnoremap <leader>lh :call CocAction('doHover')<CR>
nnoremap <leader>lo :CocList outline<CR>
nnoremap <leader>lp :CocList diagnostics<CR>
nnoremap <leader>l? :CocInfo<CR>
nnoremap <leader>lr :CocRestart<CR>
nnoremap N Nzz
nnoremap gsv :so $MYVIMRC<CR>
nnoremap <silent> fn :noh<CR>

" window resizing
nnoremap <silent> <leader>k :exe "resize " . (winheight(0) * 3/4)<CR>zz
nnoremap <silent> <leader>j :exe "resize " . (winheight(0) * 4/3)<CR>zz
nnoremap <silent> <leader>h :exe "vertical resize " . (winwidth(0) * 2/3)<CR>^
nnoremap <silent> <leader>l :exe "vertical resize " . (winwidth(0) * 3/2)<CR>^

"split pane
nnoremap <silent> we :vsp<CR><C-W><C-L>
nnoremap <silent> ws :sp<CR><C-W><C-J>
nnoremap <silent> wr <C-W><C-=>
nnoremap <silent> wq :x<CR>

"split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" "Move lines up and down
" " It might look weird, but those are option + j and option + k for down and up
" nnoremap µ :m .+1<CR>==
" nnoremap ≤ :m .-2<CR>==
" " Duplicate a line down
" nnoremap <A-Down> :t.<CR>
" " Get out of nvim terminal back to normal mode
" :tnoremap <Esc> <C-\><C-n>

" tables
" https://github.com/dhruvasagar/vim-table-mode
call minpac#add('dhruvasagar/vim-table-mode')
nmap <leader>tm :TableModeToggle

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" md compatible
let g:table_mode_corner='|'
" ReSt compatible
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='


"??
if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden
end

" set norelativenumber
