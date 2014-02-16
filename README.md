## ファイル構成

* 最初に読まれる: ~/.emacs.d/init.el
* 共通設定置き場: ~/.emacs.d/conf
    * 基本的な設定ファイル: settings.el
	* 基本的なキーバインドの設定: keybinds.el
    * Mac向け・モードごとのキーバインドの設定: sub-keybinds.el
    * エラー出ても読み込む最小の設定: initialize.el
    * カラーテーマ: color-theme/
* パッケージ置き場(自動生成): ~/.emacs.d/el-get/
* パッケージ設定ファイル置き場: ~/.emacs.d/el-get-init-files/
* スニペット置き場: ~/.emacs.d/snippets/
* eshellのalias: ~/.eshell/alias


## helmで全てのローカルファイルにアクセス

	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist


## ローマ字入力で日本語インクリメンタルサーチ（migemo）

@see http://d.hatena.ne.jp/ground256/20111008/1318063872


### cmigemoインストール


* cmigemo開発: http://www.kaoriya.net/software/cmigemo
* cmigemoソース: http://code.google.com/p/cmigemo/downloads/list

上記からcmigemoのソースをDL後、

	> chmod +x configure
	> ./configure

src/wordbuf.cにlimits.hのインクルードを追加

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <limits.h>/* この行を追加 */
	#include "wordbuf.h"

下記コマンドでインストール

	> make osx
	> make osx-dict
	> cd dict
	> make utf-8
	> cd ..
	> sudo make osx-install


##  eshellのエイリアス設定

~/.eshell/alias にエイリアスを記述
（以下、例）

	alias term open -a /Applications/iTerm.app $1
	alias less view-file $1
	alias l ls -l $*
	alias be bundle exec $*


## Markdown

init-markdown-mode.el に以下の設定を行うことで、
[Marked](http://markedapp.com) をViewerとして設定しており、
ファイルを保存すると変更点を自動的に反映する

    (custom-set-variables
        '(markdown-open-command "/Applications/Marked.app/Contents/Resources/mark"))

（init.el に markdown-mode.el をインストールするように設定してある）

C-c C-c p でプレビューする

	brew install markdown


## ispell(スペルチェッカー）

apellをインストール

	 brew install aspell --with-lang-en

ホームディレクトリ以下に.apell.confをつくりlang en_USを書く

	 echo "lang en_US" > ~/.aspell.conf


## ctags

メソット定義にジャンプ
Macだともともと入っているが少し違うので

	 brew install ctags

プロジェクトルートで以下のように実行してタグを作る

     ctags -Re


## yatex

まずはMacTexのpkgを[ここ](http://tug.org/mactex/)からダウンロードしてインストールする．
次にyatexのコードをダウンロード

	curl -O http://www.yatex.org/yatex1.77.tar.gz

ダウンロードが終わったら解凍して，yatex1.77の中のmakefileファイルの中身をを自分のパスに書き換える．

	EMACS     = /Applications/Emacs.app/Contents/MacOS/Emacs
	PREFIX    = /Applications/Emacs.app/Contents/Resources
	EMACSDIR  = ${PREFIX}

その後

	make install

これでemacsにインストール完了．
後は[ここ](http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX#p7238e02)をみて以下の設定を自分のinit.elとかにかく．
プレビューには[Skim](http://sourceforge.net/projects/skim-app/)が便利．


# ag.el

the silver searchが必要なので以下実行

	brew isntall the_silver_search



# Rsense

brewでインストールし，メッセージ通りにコマンド実行

	brew install rsene
    ruby /usr/local/Cellar/rsense/0.3/libexec/etc/config.rb > ~/.rsense
