# NAGANO CAKE
 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文がくるようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを解説しようと思い至った。
 
# 実装機能
## 顧客画面
  - ログイン・ログアウト
  - 会員登録・編集
  - 退会
  - 商品一覧・詳細
  - ジャンル検索
  - カート追加・削除・一覧
  - 配送先追加・編集・削除
  - 注文
  - 注文履歴一覧・詳細
  
  
## 管理者画面
 - ログイン・ログアウト  
 - ジャンル登録・編集・削除
  - 商品の登録・編集・削除
  - 注文履歴一覧
  - 注文状況詳細・ステータス変更
  - 会員情報の確認・編集
 
# 開発環境

## 使用言語
- Ruby 2.6.3
- Rails 5.2.4.4


## Gem
  - bootstrap
  - devise
  - kaminari
  - jquery-rails
  - refile
 
# インストール

  

  $ git clone git@github.com:JetBlackVageStore/Naganocake.git
  $ cd Naganocake
  $ rails db:seed
  $ rails db:migrate
  

 
#ログイン方法

最初のadmin側ログインは 
メールアドレス：test@test  
パスワード：testtest  
を入力してログインしてください。
※事前に【rails db:seed】でデータを入れてから行ってください

customer側の会員登録は新規登録から行ってください。
 
# チーム紹介
## EDM
## メンバー紹介
- ゆっちぇ
- なかじ
- にっしぃ
- むー
