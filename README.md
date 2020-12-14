# アプリ概要
音楽アルバムのレビューを様々な人とシェア出来るサービスです。

# 使用言語
フロントエンド(javascript, jQuery, HTML/CSS, Sass)  バックエンド(Ruby on Rails5.2, Spotify API)  テスト(RSpec, FactoryBot, Capybara)  データベース(MySQL)  コンテナ(Docker, docker-compose)  開発環境(MacOS, VScode, Git, GitHub, bash)  本番環境(heroku, S3)

# 機能
### アルバム検索
・新規アルバム検索  ・既存アルバム検索

### アルバムレビュー
・五段階評価  ・アルバムの平均点  ・タイトルと本文  ・自分が投稿したレビュー意外にいいねが可能

### ユーザーフォロー
・フォロー一覧  ・フォロワー一覧

### DM
・メッセージ送信機能

### 通知
・メッセージ受信時に通知  ・フォローされた際に通知  ・自身のレビューがいいねされた際に通知

### UI
・レスポンシブ対応  ・ハンバーガーメニュー

# 懸念点
・デプロイ先がheroku  ・CircleCI未導入  ・テストの数、内容  ・UI  ・機能数

# 今後の課題
・デプロイ先をAWSに変更  ・CircleCIの導入  ・テストの熟練  ・非同期通信で動かせる場所を増やし、感覚的に操作が出来るようなUIに改善  ・レビューを書きたくなる機能の追加

# 解決したい課題
サブスクリプションの普及により世の中にある音楽がいつでも簡単に聴けるようになったことにより
従来より、広く浅く音楽を聴くようになり、1曲やアルバム1枚の感覚価値の低下。

### このアプリを開発した理由
数年前まではアルバムを買い、次に何が流れるかを把握するまで聞き込んでいました。

しかし、サブスクリプションの普及により、私自身もアルバムを通しで聴くことが
かなり少なくなっていました。

いつでも聴きたい音楽が聴ける現代ですが、アルバムで音楽を聴く楽しみも
残したいという思いがきっかけです。

曲はもちろん、アルバムの曲順や、ジャケットのデザインなど
アーティストのこだわりを深く理解しようとする姿勢を持つことで
音楽を聴く行為がさらに楽しいものになって欲しいです。

アルバムについて考えたことや感じたことを文字起こしし、それをシェアすることにより
1曲1曲やアルバム1枚を深く理解しようとする姿勢の向上に繋がるのでは？という考えから開発しました。

# 使い方
*サンプルユーザーからログインすることで簡単にアプリを試すことが出来ます。

### レビューページ検索、でお気に入りのアルバムを検索してみましょう
人のレビューにいいねや、レビューの書き込みが出来ます。

### アルバムを探す、で新たなレビューページを作成してみましょう
新たにレビューページを作成し、レビューが書き込めます。

### ユーザー検索で友人や、音楽の趣味が近い人をフォローしてみよう
チャットすることも可能です。