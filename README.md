# README
## チャットルーム　サービス概要

* 社内向けのチャットツール

## 必要モデル

* user(deviseのgem使用)

* messageモデル

* roomチャネル(rails g channelで作成)でtalkアクション作成 #ActionCableの機能


## フロントエンド側（外見）
* javascriptかjQuery、bootstrapなどを使用


データベースの設定を -d postgresqlに設定。



5/17とりあえず試作品ができた感想

JavaScript周りがかなり大変。jqueryのgem入れ忘れてたのわからなくてなぜエラーが出るのかわかっていなかった。笑

必要になるであろうカラムやモデル、データベースは先に考えてあるためそこら辺は問題ないと思うが今回使用したjavascript周りは機能としては理解したが実際なぜそのような文法でそのようなアクションになるのかをまだ完璧に理解していないため、まずは理解してから次へ進む。


試作品は"chatroom"の機能だけ設定

コメントを入れたら即座にブラウザ上に表示されるようにする。

次は誰がコメントしたのかわかるようにする、ログイン、ログアウト、パスワード変更のためのメール設定機能、個人の設定viewと機能、自分のコメントだけ右に表示させる。ユーザー周りの設定をする。


それ以降はbootstrapで表示を整えてherokuでネットにあげたら完成予定。



5/19 メッセージ機能実装

何故かメッセージが表示されなくなった挙句にusernameが認識されていないためどこがおかしいのか模索。

対策：メッセージの際にusernameもhiddenつけて送る。channelのtalkアクションにuser関係を追加。cabel-connectionにdeviseを参照できるように追加。最終的にはエラーが出てusernameが認識できないと言われてどうしてか悩んだ結果 _message.html.erb_ の表示がmessage.usernameになっていたところをmessage.user.usernameに変更したら直った。そりゃそうだ、messageクラスに付随しているuserクラスのusernameカラム使いたいんだから記載がおかしかった。

seeds.rbを用いて別のユーザーのメッセージも表示しているか、確認できるかなどを確認。できた。

次はcss周りを弄って、自分のコメントは右に表示させメッセージ背景の色を変更するかユーザー設定を変更できるよう機能追加やメッセージの横に画像も表示できるようにするかどっちか。

追記：とりあえずavatar（画像）の設定できました。次はomniauthを導入してTwitterとFacebookログイン機能を実装。できたら後はcssやbootstrapで概見整えて完成！


5/21 ようやくtwitter-omniauthを使用してコメントできました。
理由はindexのcurrent_user.usernameがomniauthに適応されない（auth.name.nickname)のようにtwitter-omniauthのnicknameをusernameで渡しても適応されなかったため。

あとはようやくcss,bootstrapです。

5/22　と思ったけどまずはdeviseで編集できるものを修正

5/23 昨日は全然進まなかったけれど、とりあえずメールでパスワード変更できるように設定します。

ようやくプロフィール機能修正完了。次こそデザインなのか？

5/24 残念ながら本日は歓迎会のためできない
