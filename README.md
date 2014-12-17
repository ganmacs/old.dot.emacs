__This is old emacs file__
my new emacs config file is https://github.com/ganmacs/emacs.d


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

```
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```

## ローマ字入力で日本語インクリメンタルサーチ（migemo）

cmigemoインストール

```
$ brew install cmigemo
```

## Markdownを使う

init-markdown-mode.el に以下の設定を行うことで、
[Marked2](http://marked2app.com/) をViewerとして設定しており、
ファイルを保存すると変更点を自動的に反映する

```
$ brew install markdown
```

## 英語スペルチェッカー

apellをインストール

```
$ brew install aspell --with-lang-en
```

ホームディレクトリ以下に.apell.confをつくりlang en_USを書く

```
$ echo "lang en_US" > ~/.aspell.conf
```

## メソッドジャンプ

メソット定義にジャンプ
Macだともともと入っているが少し違うので

```
$ brew install ctags
```

プロジェクトルートで以下のように実行してタグを作る

```
$ ctags -Re
```

## texをつかえるようにする

まずはMacTexのpkgを[ここ](http://tug.org/mactex/)からダウンロードしてインストールする．
次にyatexのコードをダウンロード

```
curl -O http://www.yatex.org/yatex1.77.tar.gz
```

ダウンロードが終わったら解凍して，yatex1.77の中のmakefileファイルの中身をを自分のパスに書き換える．

```
EMACS     = /Applications/Emacs.app/Contents/MacOS/Emacs
PREFIX    = /Applications/Emacs.app/Contents/Resources
EMACSDIR  = ${PREFIX}
```

その後

```
$ make install
```

これでemacsにインストール完了．
後は[ここ](http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX#p7238e02)をみて以下の設定を自分のinit.elとかにかく．
プレビューには[Skim](http://sourceforge.net/projects/skim-app/)が便利．


## grepを高速でできる

the silver searchが必要なので以下実行

```
$ brew isntall the_silver_search
```
