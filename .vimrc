"#####表示設定#####
set encoding=utf-8
set number      "行番号を表示する
set title       "編集中のファイル名を表示
set showmatch   "括弧入力時の対応する括弧を表示
set tabstop=4   "インデントをスペース4つ分に設定
set smartindent "オートインデント

"#####ステータスライン#####
set statusline=%F  "ファイル名を表示
set statusline+=%m "変更チェック表示
set statusline+=%r "読み込み専用かどうか表示
set statusline+=%h "ヘルプページなら[HELP]と表示
set statusline+=%w "プレビューウィンドウなら[Prevew]と表示
set statusline+=%= "これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] "File Encoding の表示
set statusline+=[LOW=%l/%L]            "現在行数/全行数の表示
set laststatus=2   "ステータスラインを常に表示（0:非表示 1:ウィンドウが複数の時だけ表示）

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase  "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan   "検索時に最後まで行ったら最初に戻る

"#####シンタックスハイライト#####
syntax on
set nohlsearch
set cursorline

"#####dein設定#####
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" プラグインリストを収めた TOML ファイル
	" 予め TOML ファイル（後述）を用意しておく
	let g:rc_dir    = expand('~/.vim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	" 設定終了
	call dein#end()
	call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif

" colorscheme molokai
syntax on
set t_Co=256
set ambiwidth=double
set noexpandtab
set shiftwidth=4
set softtabstop=0

" esc の代用キー
noremap <C -[> <esc>

" NERDTree を Ctrl+e で呼び出し
nnoremap <silent><C-e> :NERDTreeToggle<CR>

