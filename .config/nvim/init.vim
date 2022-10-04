set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin("~/.config/nvim/bundle")
Plugin 'VundleVim/Vundle.vim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-cmp'
Plugin 'christoomey/vim-system-copy'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'dracula/vim', {'as': 'dracula'}
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'ryanoasis/vim-devicons'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'vim-python/python-syntax'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tell-k/vim-autopep8'
call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
set clipboard+=unnamedplus
" Автоотступ
set autoindent
" Подсвечиваем все что можно подсвечивать
"let python_highlight_all = 1
let g:python_highlight_all = 1

" ctags
set tags=./tags;/
" буфер обмена
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

" autopep8
" форматирование по \ p
" не показывать diff при autopep8
let g:autopep8_disable_show_diff=1 " не показывать diff при autopep8
autocmd FileType python noremap <buffer> <leader>p :call Autopep8()<CR> 
" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

set number " Показывать нумерацию строк
set so=5 " Оставлять 5 строк снизу или сверху при пролистывании
set relativenumber

syntax on "Включить подсветку синтаксиса

" set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала

set novisualbell "Не мигать 
set visualbell t_vb= " Выключаем звук в Vim
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)

" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Вырубаем черточки на табах
set showtabline=1

" Переносим на другую строчку, разрываем строки
set wrap
set linebreak

" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set clipboard=unnamed
set ruler
set colorcolumn=74
set hidden

" Мэппинги
" переключение между буферами
" nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>

nnoremap x "_x

" сохрананить изменения Шифт+WW
nnoremap WW :w<CR> 
" Выбрать все
nmap <C-a> gg<S-v>G

" Ctrl+C - Esc
nnoremap <C-c> <Esc>

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <leader>x :silent !chmod +x %<CR>

" Мэппинг для табов 
" Табом переход на следующую вкладку
" Шифт-Таб обратно
nmap te :tabedit
" nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>
nmap <S-Tab> :bnext<CR>                                                                            
nmap <Tab> :bprev<CR>

" nmap <S-Tab> :tabprevious<Return>                                                                            
" nmap <Tab> :tabnext<Return>

" Снять выделение после поиска
nmap <leader>z :noh<CR> 
 " fzf список файлов
nmap <leader>f :Files<CR>
" fzf Список буферов
nmap <leader>b :Buffers<CR> 
" настройки привью fzf
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" NERDTree hotkeys
" let NERDTreeQuitOnOpen=1
" let g:NERDTreeMinimalUI=1
" let g:NERDTreeWinSize=25
" let NERDTreeIgnore=['\~$', '__pycache__', '\.pyc$']
" let NERDTreeDirArrows = 1
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-f> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Автозапуск NERDTree если вим запущен без файлового аргумента
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" lua << EOF
" -- Set completeopt to have a better completion experience
" vim.o.completeopt = 'menuone,noselect'

" -- nvim-cmp setup
" local cmp = require 'cmp'
" cmp.setup {
"   completion = {
"     autocomplete = false
"   },
"   mapping = {
"     ['<C-p>'] = cmp.mapping.select_prev_item(),
"     ['<C-n>'] = cmp.mapping.select_next_item(),
"     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"     ['<C-f>'] = cmp.mapping.scroll_docs(4),
"     ['<C-Space>'] = cmp.mapping.complete(),
"     ['<C-e>'] = cmp.mapping.close(),
"     ['<CR>'] = cmp.mapping.confirm {
"       behavior = cmp.ConfirmBehavior.Replace,
"       select = true,
"     },
"   },
"   sources = {
"     { name = 'nvim_lsp' },
"   },
" }

" local nvim_lsp = require('lspconfig')

" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)

"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

"   -- Enable completion triggered by <c-x><c-o>
"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

"   -- Mappings.
"   local opts = { noremap=true, silent=true }

"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
" end

" -- Use a loop to conveniently call 'setup' on multiple servers and
" -- map buffer local keybindings when the language server attaches
" local servers = { 'pyright' }
" for _, lsp in ipairs(servers) do
"   nvim_lsp[lsp].setup {
"     on_attach = on_attach,
"     flags = {
"       debounce_text_changes = 150,
"     }
"   }
" end
" EOF


set guifont=Monaco:h18
colorschem dracula
