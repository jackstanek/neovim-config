local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- LSP packages
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'lewis6991/nvim-treesitter-context'

  -- Snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-vsnip'
  use 'rafamadriz/friendly-snippets'

  use 'mhartington/oceanic-next'

  use 'Vimjas/vim-python-pep8-indent'    -- python indentation style

  use 'airblade/vim-gitgutter'           -- git info in gutter
  use 'vim-airline/vim-airline'          -- airline
  use 'Yggdroot/indentLine'              -- indentation guides
  use 'simrat39/symbols-outline.nvim'    -- symbol navigation
  use 'machakann/vim-sandwich'           -- surrouding stuff
  use 'junegunn/fzf'                     -- fuzzy finding
  use 'junegunn/fzf.vim'
  use 'gfanto/fzf-lsp.nvim'              -- fuzzy LSP symbol search
  use 'junegunn/rainbow_parentheses.vim' -- rainbow parentheses
  use 'tpope/vim-abolish'                -- fancy replacing
  use 'tpope/vim-commentary'             -- code commenting
  use 'tpope/vim-fugitive'               -- git integration
  use 'wfxr/minimap.vim'                 -- minimap
  use {                                  -- multiple cursors
      'mg979/vim-visual-multi',
      branch = 'master'
  }
  use {                                  -- file tree
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',    -- for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'phaazon/hop.nvim',                  -- quick jump
    branch = 'v1',
    config = function()
      require'hop'.setup {}
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
