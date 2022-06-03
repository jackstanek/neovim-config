set number relativenumber

set colorcolumn=120
set cursorline
set signcolumn=yes
set scrolloff=5
set updatetime=100
set mouse=a

set expandtab
set shiftwidth=4
set softtabstop=4
set list
set autoindent
set backspace=indent,eol,start

set completeopt=menu,menuone,noselect
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"Custom keybindings
let mapleader = ","
map <leader>s :SymbolsOutline<CR>
map <leader>t :NvimTreeToggle<CR>

" Hop
map <leader>hw :HopWord<CR>
map <leader>hl :HopLine<CR>
map <leader>hc :HopChar1<CR>

"Should this use g:fzf_command_prefix?
map <leader>ff :Files<CR>
map <leader>fb :Buffers<CR>
map <leader>fg :GFiles<CR>
map <leader>fr :References<CR>
map <leader>fl :Lines<CR>
map <leader>fc :Commands<CR>
map <leader>fs :DocumentSymbols<CR>

"File formatting options
filetype indent on
autocmd BufReadPost,FileReadPost * normal zR
autocmd BufWritePre * :%s/\s\+$//e

"Set the color scheme
colorscheme OceanicNext

"See https://github.com/morhetz/gruvbox/wiki/Terminal-specific about terminal
"color scheme information
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

augroup reload_config
  autocmd!
  autocmd BufWritePost *.lua source <afile> | PackerCompile
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  echom "Reloaded configuration"
augroup end

lua <<EOF
require('plugins')
require('lspsetup')
require('treesitter')
EOF
