set nocompatible
syntax on

if exists('+colorcolumn')
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,120"
endif

let mapleader=","
let maplocalleader="\\"

set nowrap
set tabstop=2
set softtabstop=2
set expandtab
set copyindent
set number
set shiftwidth=2
set shiftround
set showmatch
set smartcase
set ignorecase
set hlsearch
set pastetoggle=<F2>
set splitbelow
set splitright

set mouse+=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif

set hidden
set nobackup
set noswapfile
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set nomodeline
set cursorline
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nnoremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>
nnoremap ; :
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnorema <leader>lu :set ff=unix<CR>