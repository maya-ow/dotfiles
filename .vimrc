"#####初期設定#####
"set encoding=utf-8      "文字コードをUTF-8に設定
set fenc=utf-8          "文字コードをUTF-8に設定
set nobackup            "バックアップファイルを作らない
set noswapfile          "スワップファイルを作らない
set autoread            "編集中のファイルが変更されたら自動で読み直す
set hidden              "バッファが編集中でもその他のファイルを開けるようにする
set showcmd             "入力中のコマンドをステータスに表示する


"#####表示設定#####
set number              "行番号を表示する
set cursorline          "現在の行を強調表示
"set cursorcolumn        "現在の行を強調表示（縦）
set virtualedit=onemore "行末の１まじ先までカーソルを移動できるようにする
set title               "編集中のファイル名を表示
set showmatch           "括弧入力時の対応する括弧を表示
set tabstop=4           "インデントをスペース4つ分に設定
set smartindent         "インデントはスマートインデント
set visualbell          "ビープ音を可視化
set wildmode=list:longest "コマンドラインの補完
"nnoremap j gj           "折り返し時に表示行単位での移動ができるようにする
"nnoremap k gk           "折り返し時に表示行単位での移動ができるようにする

"#####Tab系#####
set list listchars=tab:\▸\- "不可視文字を可視化
set expandtab           "Tab 文字を半角スペースにする
"set noexpandtab
set tabstop=4           "先頭以外の Tab 文字の表示幅（スペースいくつ分）
set shiftwidth=4        "行頭での Tab 文字の表示幅
"set softtabstop=0

"#####ステータスライン#####
set statusline=%F       "ファイル名を表示
set statusline+=%m      "変更チェック表示
set statusline+=%r      "読み込み専用かどうか表示
set statusline+=%h      "ヘルプページなら[HELP]と表示
set statusline+=%w      "プレビューウィンドウなら[Prevew]と表示
set statusline+=%=      "これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] "File Encoding の表示
set statusline+=[LOW=%l/%L]            "現在行数/全行数の表示
set laststatus=2        "ステータスラインを常に表示（0:非表示 1:ウィンドウが複数の時だけ表示）

"#####検索設定#####
set ignorecase          "大文字/小文字の区別なく検索する
set smartcase           "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch           "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan            "検索時に最後まで行ったら最初に戻る
set hlsearch            "検索語をハイライト表示
"set nohlsearch          "検索語をハイライト表示しない
nmap <Esc><Esc> :nohlsearch<CR><Esc> "ESC連打でハイライト解除

"#####シンタックスハイライト#####
set t_Co=256
"set ambiwidth=double
set background=dark
colorscheme hybrid
"colorscheme solarized "カラースキーマ solarized
"colorscheme molokai "カラースキーマ molokai
syntax on

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

" esc の代用キー
noremap <C -[> <esc>

" NERDTree を Ctrl+e で呼び出し
nnoremap <silent><C-e> :NERDTreeToggle<CR>

