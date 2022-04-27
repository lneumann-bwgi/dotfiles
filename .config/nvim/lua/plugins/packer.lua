-- bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig' -- basic lsp
    use 'williamboman/nvim-lsp-installer' -- provides LspInstall 

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'
    use 'andymass/vim-matchup'

    -- misc
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'karb94/neoscroll.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'windwp/nvim-autopairs'
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }

    -- colorshemes
    use "ellisonleao/gruvbox.nvim"


end)
