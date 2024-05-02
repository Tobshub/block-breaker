let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <C-Bslash> <Cmd>ToggleTerm
imap <M-Bslash> <Plug>(codeium-complete)
imap <M-[> <Plug>(codeium-previous)
imap <M-]> <Plug>(codeium-next-or-complete)
imap <Plug>(codeium-complete) <Cmd>call codeium#Complete()
imap <Plug>(codeium-previous) <Cmd>call codeium#CycleCompletions(-1)
imap <Plug>(codeium-next-or-complete) <Cmd>call codeium#CycleOrComplete()
imap <Plug>(codeium-next) <Cmd>call codeium#CycleCompletions(1)
imap <Plug>(codeium-dismiss) <Cmd>call codeium#Clear()
inoremap <C-L> <Del>
inoremap <silent> <M-Left> h
inoremap <silent> <M-k> :m .-2==gi
inoremap <silent> <M-Right> l
inoremap <silent> <M-j> :m .+1==gi
inoremap <silent> <M-Down> j
inoremap <silent> <M-Up> k
inoremap <C-W> u
inoremap <C-U> u
nnoremap <silent>  h
tnoremap  <BS>
nnoremap <silent> <NL> j
tnoremap <silent> <NL> j
nnoremap <silent>  k
tnoremap <silent>  k
tnoremap  <Del>
nnoremap <silent>  l
nnoremap <silent>  :call QuickFixToggle()
nnoremap <silent>  :w
tnoremap  
nnoremap <silent>  <Cmd>execute v:count . "ToggleTerm"
nnoremap <silent>  lÞ <Nop>
nnoremap <silent>  l <Cmd>lua require("which-key").show(" l", {mode = "n", auto = true})
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
xnoremap <silent>  lÞ <Nop>
xnoremap <silent>  Þ <Nop>
xnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "v", auto = true})
vmap <nowait> <silent>  / <Plug>(comment_toggle_linewise_visual)
vnoremap <nowait> <silent>  la <Cmd>lua vim.lsp.buf.code_action()
nnoremap <silent>  pÞ <Nop>
nnoremap <silent>  dÞ <Nop>
nnoremap <silent>  sÞ <Nop>
nnoremap <silent>  bÞ <Nop>
nnoremap <silent>  LlÞ <Nop>
nnoremap <silent>  LÞ <Nop>
nnoremap <silent>  gÞ <Nop>
nnoremap <silent>  TÞ <Nop>
nnoremap <nowait> <silent>  c <Cmd>BufferKill
nnoremap <nowait> <silent>  ; <Cmd>Alpha
nnoremap <nowait> <silent>  h <Cmd>nohlsearch
nnoremap <nowait> <silent>  lS <Cmd>Telescope lsp_dynamic_workspace_symbols
nnoremap <nowait> <silent>  li <Cmd>LspInfo
nnoremap <nowait> <silent>  ll <Cmd>lua vim.lsp.codelens.run()
nnoremap <nowait> <silent>  la <Cmd>lua vim.lsp.buf.code_action()
nnoremap <nowait> <silent>  ls <Cmd>Telescope lsp_document_symbols
nnoremap <nowait> <silent>  lI <Cmd>Mason
nnoremap <nowait> <silent>  lk <Cmd>lua vim.diagnostic.goto_prev()
nnoremap <nowait> <silent>  lr <Cmd>lua vim.lsp.buf.rename()
nnoremap <nowait> <silent>  lw <Cmd>Telescope diagnostics
nnoremap <nowait> <silent>  ld <Cmd>Telescope diagnostics bufnr=0 theme=get_ivy
nnoremap <nowait> <silent>  lq <Cmd>lua vim.diagnostic.setloclist()
nnoremap <nowait> <silent>  lj <Cmd>lua vim.diagnostic.goto_next()
nnoremap <nowait> <silent>  le <Cmd>Telescope quickfix
nnoremap <nowait> <silent>  dc <Cmd>lua require'dap'.continue()
nnoremap <nowait> <silent>  dr <Cmd>lua require'dap'.repl.toggle()
nnoremap <nowait> <silent>  du <Cmd>lua require'dap'.step_out()
nnoremap <nowait> <silent>  dp <Cmd>lua require'dap'.pause()
nnoremap <nowait> <silent>  dd <Cmd>lua require'dap'.disconnect()
nnoremap <nowait> <silent>  ds <Cmd>lua require'dap'.continue()
nnoremap <nowait> <silent>  di <Cmd>lua require'dap'.step_into()
nnoremap <nowait> <silent>  dt <Cmd>lua require'dap'.toggle_breakpoint()
nnoremap <nowait> <silent>  dg <Cmd>lua require'dap'.session()
nnoremap <nowait> <silent>  dU <Cmd>lua require'dapui'.toggle({reset = true})
nnoremap <nowait> <silent>  do <Cmd>lua require'dap'.step_over()
nnoremap <nowait> <silent>  dC <Cmd>lua require'dap'.run_to_cursor()
nnoremap <nowait> <silent>  dq <Cmd>lua require'dap'.close()
nnoremap <nowait> <silent>  db <Cmd>lua require'dap'.step_back()
nnoremap <nowait> <silent>  sf <Cmd>Telescope find_files
nnoremap <nowait> <silent>  sk <Cmd>Telescope keymaps
nnoremap <nowait> <silent>  sh <Cmd>Telescope help_tags
nnoremap <nowait> <silent>  sp <Cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})
nnoremap <nowait> <silent>  sl <Cmd>Telescope resume
nnoremap <nowait> <silent>  sM <Cmd>Telescope man_pages
nnoremap <nowait> <silent>  sc <Cmd>Telescope colorscheme
nnoremap <nowait> <silent>  st <Cmd>Telescope live_grep
nnoremap <nowait> <silent>  sr <Cmd>Telescope oldfiles
nnoremap <nowait> <silent>  sH <Cmd>Telescope highlights
nnoremap <nowait> <silent>  sR <Cmd>Telescope registers
nnoremap <nowait> <silent>  sC <Cmd>Telescope commands
nnoremap <nowait> <silent>  sb <Cmd>Telescope git_branches
nnoremap <nowait> <silent>  bf <Cmd>Telescope buffers previewer=false
nnoremap <nowait> <silent>  bn <Cmd>BufferLineCycleNext
nnoremap <nowait> <silent>  bh <Cmd>BufferLineCloseLeft
nnoremap <nowait> <silent>  bW <Cmd>noautocmd w
nnoremap <nowait> <silent>  be <Cmd>BufferLinePickClose
nnoremap <nowait> <silent>  bl <Cmd>BufferLineCloseRight
nnoremap <nowait> <silent>  bL <Cmd>BufferLineSortByExtension
nnoremap <nowait> <silent>  bD <Cmd>BufferLineSortByDirectory
nnoremap <nowait> <silent>  bj <Cmd>BufferLinePick
nnoremap <nowait> <silent>  bb <Cmd>BufferLineCyclePrev
nnoremap <nowait> <silent>  Lf <Cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()
nnoremap <nowait> <silent>  Lln <Cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))
nnoremap <nowait> <silent>  LlD <Cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())
nnoremap <nowait> <silent>  Lll <Cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())
nnoremap <nowait> <silent>  Lld <Cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())
nnoremap <nowait> <silent>  LlN <Cmd>edit $NVIM_LOG_FILE
nnoremap <nowait> <silent>  LlL <Cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())
nnoremap <nowait> <silent>  Lu <Cmd>LvimUpdate
nnoremap <nowait> <silent>  LI <Cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()
nnoremap <nowait> <silent>  Ld <Cmd>LvimDocs
nnoremap <nowait> <silent>  Lg <Cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()
nnoremap <nowait> <silent>  Li <Cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)
nnoremap <nowait> <silent>  Lk <Cmd>Telescope keymaps
nnoremap <nowait> <silent>  Lr <Cmd>LvimReload
nnoremap <nowait> <silent>  Lc <Cmd>edit /home/tobs/.config/lvim/config.lua
nmap <nowait> <silent>  / <Plug>(comment_toggle_linewise_current)
nnoremap <nowait> <silent>  w <Cmd>w!
nnoremap <nowait> <silent>  pc <Cmd>Lazy clean
nnoremap <nowait> <silent>  pS <Cmd>Lazy clear
nnoremap <nowait> <silent>  pu <Cmd>Lazy update
nnoremap <nowait> <silent>  pi <Cmd>Lazy install
nnoremap <nowait> <silent>  pd <Cmd>Lazy debug
nnoremap <nowait> <silent>  ps <Cmd>Lazy sync
nnoremap <nowait> <silent>  pl <Cmd>Lazy log
nnoremap <nowait> <silent>  pp <Cmd>Lazy profile
nnoremap <nowait> <silent>  Ti :TSConfigInfo
nnoremap <nowait> <silent>  gc <Cmd>Telescope git_commits
nnoremap <nowait> <silent>  gl <Cmd>lua require 'gitsigns'.blame_line()
nnoremap <nowait> <silent>  gu <Cmd>lua require 'gitsigns'.undo_stage_hunk()
nnoremap <nowait> <silent>  go <Cmd>Telescope git_status
nnoremap <nowait> <silent>  gd <Cmd>Gitsigns diffthis HEAD
nnoremap <nowait> <silent>  gs <Cmd>lua require 'gitsigns'.stage_hunk()
nnoremap <nowait> <silent>  gg <Cmd>lua require 'lvim.core.terminal'.lazygit_toggle()
nnoremap <nowait> <silent>  gk <Cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})
nnoremap <nowait> <silent>  gr <Cmd>lua require 'gitsigns'.reset_hunk()
nnoremap <nowait> <silent>  gp <Cmd>lua require 'gitsigns'.preview_hunk()
nnoremap <nowait> <silent>  gR <Cmd>lua require 'gitsigns'.reset_buffer()
nnoremap <nowait> <silent>  gC <Cmd>Telescope git_bcommits
nnoremap <nowait> <silent>  gj <Cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})
nnoremap <nowait> <silent>  gb <Cmd>Telescope git_branches
nnoremap <nowait> <silent>  q <Cmd>confirm q
nnoremap <nowait> <silent>  e <Cmd>NvimTreeToggle
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
xnoremap * y/\V"
vnoremap <silent> < <gv
vnoremap <silent> > >gv
nnoremap <silent> H :BufferLineCyclePrev
nnoremap <silent> L :BufferLineCycleNext
vnoremap Y "+y
nnoremap Y y$
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap <silent> [q :cprev
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ]q :cnext
xnoremap <silent> aÞ <Nop>
xnoremap <silent> a <Cmd>lua require("which-key").show("a", {mode = "v", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap <silent> iÞ <Nop>
xnoremap <silent> i <Cmd>lua require("which-key").show("i", {mode = "v", auto = true})
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
nnoremap <silent> <C-Bslash> <Cmd>execute v:count . "ToggleTerm"
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
nnoremap <silent> <C-S> :w
nnoremap <C-;> q:
xnoremap <silent> <M-k> :m '<-2gv-gv
xnoremap <silent> <M-j> :m '>+1gv-gv
nnoremap <silent> <M-j> :m .+1==
nnoremap <silent> <M-k> :m .-2==
nnoremap <silent> <C-K> k
nnoremap <silent> <C-J> j
nnoremap <silent> <C-H> h
nnoremap <silent> <C-Q> :call QuickFixToggle()
nnoremap <silent> <C-Right> :vertical resize +2
nnoremap <silent> <C-Left> :vertical resize -2
nnoremap <silent> <C-Down> :resize +2
nnoremap <silent> <C-Up> :resize -2
tnoremap <silent> <C-K> k
tnoremap <silent> <C-J> j
tnoremap <C-L> <Del>
tnoremap <C-H> <BS>
nnoremap <silent> <C-L> l
inoremap  <Del>
inoremap  u
inoremap  u
inoremap <silent>  <Cmd>ToggleTerm
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamed
set completeopt=menuone,noselect
set guifont=monospace:h17
set helplang=en
set ignorecase
set laststatus=3
set listchars=extends:<,nbsp:+,precedes:>,tab:\ \ ,trail:-
set noloadplugins
set mouse=a
set operatorfunc=v:lua.require'Comment.api'.locked'toggle.linewise.current'
set packpath=/tmp/.mount_lvimROvhZg/usr/share/nvim/runtime
set pumheight=10
set noruler
set runtimepath=~/.local/share/lunarvim/site/pack/lazy/opt/nvim-treesitter,~/.config/lvim,~/.local/share/lunarvim/lvim,~/.local/share/lunarvim/site/pack/lazy/opt/lazy.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/telescope-fzf-native.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/telescope.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/toggleterm.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-ts-context-commentstring,~/.local/share/lunarvim/site/pack/lazy/opt/null-ls.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-autopairs,~/.local/share/lunarvim/site/pack/lazy/opt/LuaSnip,~/.local/share/lunarvim/site/pack/lazy/opt/which-key.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/lualine.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/alpha-nvim,~/.local/share/lunarvim/site/pack/lazy/opt/project.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/lir.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-web-devicons,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-tree.lua,~/.local/share/lunarvim/site/pack/lazy/opt/indent-blankline.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/gitsigns.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nlsp-settings.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-lspconfig,~/.local/share/lunarvim/site/pack/lazy/opt/mason-lspconfig.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/bufferline.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/Comment.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-navic,~/.local/share/lunarvim/site/pack/lazy/opt/bigfile.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-treesitter-context,~/.local/share/lunarvim/site/pack/lazy/opt/material.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/vim-monokai-tasty,~/.local/share/lunarvim/site/pack/lazy/opt/vscode.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/mason.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/mason-nvim-dap.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-ts-autotag,~/.local/share/lunarvim/site/pack/lazy/opt/colorbuddy.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/tsodingbuddy,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-colorizer.lua,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-cmdline,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-path,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-buffer,~/.local/share/lunarvim/site/pack/lazy/opt/cmp_luasnip,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-nvim-lsp,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-cmp,~/.local/share/lunarvim/site/pack/lazy/opt/plenary.nvim,~/.local/share/lunarvim/site/pack/lazy/opt/codeium.vim,~/.local/share/lunarvim/site/pack/lazy/opt/nvim-base16,/tmp/.mount_lvimROvhZg/usr/share/nvim/runtime,/tmp/.mount_lvimROvhZg/usr/share/nvim/runtime/pack/dist/opt/matchit,/tmp/.mount_lvimROvhZg/usr/lib/nvim,~/.local/share/lunarvim/site/pack/lazy/opt/bigfile.nvim/after,~/.local/share/lunarvim/site/pack/lazy/opt/vscode.nvim/after,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-cmdline/after,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-path/after,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-buffer/after,~/.local/share/lunarvim/site/pack/lazy/opt/cmp_luasnip/after,~/.local/share/lunarvim/site/pack/lazy/opt/cmp-nvim-lsp/after,~/.local/share/lunarvim/site/after,~/.local/share/lunarvim/lazy/readme
set scrolloff=5
set shadafile=~/.cache/lvim/lvim.shada
set shiftwidth=2
set shortmess=IflxtiTFoOnc
set noshowcmd
set noshowmode
set showtabline=0
set sidescrolloff=2
set smartcase
set spelllang=en,cjk
set splitbelow
set splitright
set statusline=%#Normal#
set noswapfile
set tabline=%!v:lua.nvim_bufferline()
set tabstop=2
set termguicolors
set title
set titlestring=NVIM\ %F
set undodir=~/.cache/lvim/undo
set undofile
set updatetime=100
set whichwrap=<,>,[,],b,h,l,s
set window=38
set nowritebackup
" vim: set ft=vim :
