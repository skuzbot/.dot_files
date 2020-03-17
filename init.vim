packadd minpac

let mapleader = " "

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('tpope/vim-dadbod')
" theme
call minpac#add('tlhr/anderson.vim')
call minpac#add('liuchengxu/vim-clap')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('ervandew/supertab')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('tpope/vim-endwise')
call minpac#add('liuchengxu/vista.vim')
call minpac#add('w0rp/ale')
call minpac#add('itchyny/lightline.vim')
" snippets
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
call minpac#add('ntpeters/vim-better-whitespace')
" Ranger file tree
call minpac#add('francoiscabrol/ranger.vim')
call minpac#add('rbgrouleff/bclose.vim')
" Bracket stuff
call minpac#add('Raimondi/delimitMate')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('yuezk/vim-js')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('alvan/vim-closetag')
" commenting
call minpac#add('tomtom/tcomment_vim')

let g:db_url = $DATABASE_URL
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabMappingForward = '<s-tab>'
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:clap_layout = {'relative': 'editor'}
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
" autosave
:au FocusLost * :wa
:set autowrite
let g:tmux_navigator_save_on_switch = 2

nnoremap <leader>q :normal vip<CR>:%DB g:db_url<CR>
set termguicolors
colorscheme anderson

" whitespace
highlight WhiteSpaceBol ctermbg=lightgreen
match WhiteSpaceBol /^ \+/
set listchars=space:·
highlight WhiteSpaceBol ctermbg=blue
highlight WhiteSpaceMol guifg=white
match WhiteSpaceMol / /
match WhiteSpaceBol /^ \+/
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" mappings
vnoremap <c-q> :%DB g:db_url<CR>
nnoremap <leader>s :DB g:db_url =
nnoremap <leader>p :Clap files<CR>
nnoremap <leader>/ :silent grep<space>
nmap <leader>ld <Plug>(coc-definition)zz
nnoremap <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
nnoremap <leader>lh :call CocAction('doHover')<CR>
nnoremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :Vista<CR>
nnoremap <leader>lp :CocList diagnostics<CR>
nnoremap <leader>l? :CocInfo<CR>
nnoremap <leader>lr :CocRestart<CR>
nnoremap <leader>, :set nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap gsv :so $MYVIMRC<CR>
" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" line moving
nnoremap <c-J> dd p<space>
nnoremap <c-K> dd k k p<space>
nnoremap <esc> :noh<return><esc>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" autoclose tag settings
let g:closetag_filenames = '*.html,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden
end

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set number
set relativenumber
set incsearch
set hlsearch
set smartcase
set ignorecase
