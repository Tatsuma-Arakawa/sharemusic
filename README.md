# アプリ概要
音楽アルバムのレビューを様々な人とシェア出来るサービスです。

# 使用言語
フロントエンド(javascript, jQuery, HTML/CSS, Sass)<br>
バックエンド(Ruby on Rails5.2, Spotify API)<br>
テスト(RSpec, FactoryBot, Capybara)<br>
データベース(MySQL)<br>
コンテナ(Docker, docker-compose)<br>
開発環境(MacOS, VScode, Git, GitHub, bash)<br>
本番環境(heroku, S3)

# 機能
### アルバム検索
・新規アルバム検索<br>
・既存アルバム検索

### アルバムレビュー
・五段階評価
・アルバムの平均点<br>
・タイトルと本文<br>
・自分が投稿したレビュー意外にいいねが可能

### ユーザーフォロー
・フォロー一覧<br>
・フォロワー一覧

### DM
・メッセージ送信機能

### 通知
・メッセージ受信時に通知<br>
・フォローされた際に通知<br>
・自身のレビューがいいねされた際に通知

### UI
・レスポンシブ対応<br>
・ハンバーガーメニュー

# 懸念点
・デプロイ先がheroku<br>
・CircleCI未導入<br>
・テストの数、内容<br>
・UI<br>
・機能数

# 今後の課題
・デプロイ先をAWSに変更<br>
・CircleCIの導入<br>
・テストの熟練<br>
・非同期通信で動かせる場所を増やし、感覚的に操作が出来るようなUIに改善<br>
・レビューを書きたくなる機能の追加

# 解決したい課題
サブスクリプションの普及により世の中にある音楽がいつでも簡単に聴けるようになったことにより<br>
従来より、広く浅く音楽を聴くようになり、1曲やアルバム1枚の感覚価値の低下。

### このアプリを開発した理由
いつでも聴きたい音楽が聴ける現代ですが、アルバムで音楽を聴く楽しみも<br>
残したいという思いがきっかけです。

私自身、数年前まではアルバムを買い、次に何が流れるかを把握するまで聞き込んでいました。<br>
しかし、サブスクリプションの普及により、アルバムを通しで聴くことが<br>
かなり少なくなっていました。

曲はもちろん、アルバムの曲順や、ジャケットのデザインなど<br>
アーティストのこだわりを深く理解しようとする姿勢を持つことで<br>
音楽を聴く行為がさらに楽しいものになって欲しいです。

アルバムについて考えたことや感じたことを文字起こしし、それをシェアすることにより<br>
1曲1曲やアルバム1枚を深く理解しようとする姿勢の向上に繋がるのでは？という考えから開発しました。

# 使い方
*サンプルユーザーからログインすることで簡単にアプリを試すことが出来ます。

### レビューページ検索、でお気に入りのアルバムを検索してみましょう
人のレビューにいいねや、レビューの書き込みが出来ます。

### アルバムを探す、で新たなレビューページを作成してみましょう
新たにレビューページを作成し、レビューが書き込めます。

### ユーザー検索で友人や、音楽の趣味が近い人をフォローしてみよう
チャットすることも可能です。