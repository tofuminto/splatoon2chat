# Splatoon2 Chat
Splatoon2プレイユーザーのためのチャットスペースです。<br>
ゲーム内でのレートの表示とリーグマッチのルールとステージを確認できます。<br>
このサイトでは主にリーグマッチをメインに行うユーザー同士が、<br>対戦相手募集と仲間募集のやりとりをする場としています。<br>
<image width="800" alt="スクリーンショット" src="">
<img width="1440" alt="スクリーンショット 2021-01-14 16 40 53" src="https://user-images.githubusercontent.com/66166495/104746465-acbf6c00-5792-11eb-8046-1782fd60563a.png">


# URL
http://18.178.67.108:3000/<br>
- テスト用
  - アカウント名：test
  - パスワード：test00
<!-- 画面中部のゲストログインボタンから、アカウント名とパスワードを入力せずにログインできます。(予定) -->

# 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.4
- MySQL2 0.5.3
- Nginx
- Unicorn 5.4.1
- AWS
  - EC2
- Capistrano
- Docker/Docker-compass
- CircleCi CI/CD(予定)
- RSpec(予定)
- stat.ink API#個人アプリ引用(予定)

# 機能一覧
- ユーザー登録、ログイン機能(devise)
- メッセージ投稿機能(jquery,ajax)

# テスト
- RSpec(予定)
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(feature)