アプリケーション名	 
shoes-recipe  

アプリケーション概要
ユーザーがお手入れした靴の写真を投稿し、シェアすることができるアプリです。 

URL	                
https://shoes-recipe.herokuapp.com/
Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。


テスト用アカウント	  
BASIC認証　ID admin  パスワード　2222

User1 email sample@com パスワードa11111
User2 email test@com パスワードa11111

利用方法	              
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
レシピ投稿方法
テストアカウントでログイン→トップページからNewRecipe押下→Recipe情報入力→投稿する
コメント方法
テストアカウントでログイン→トップページからRecipe画像を押下→コメントを入力→送信する
確認後、ログアウト処理をお願いします

目指した課題解決
ニッチな趣味である靴磨きを自己満足で終わらせないことを目的としたアプリです。　靴磨き初心者がどんな道具を使ってお手入れを始めればいいかわかりやすくなります。

洗い出した要件	
・ユーザー管理機能
・投稿機能
・編集機能
・削除機能
・コメント機能

実装した機能についての画像やGIFおよびその説明	
・ユーザー管理機能　　
ビジネスマンとして靴のお手入れをすることも想定し、プロフィール欄に職業を入力できるように設定した。
また、革靴はサイズ感がとても重要なためユーザーの足の実寸を入力することができるようにした。
[![Image from Gyazo](https://i.gyazo.com/171028f610f250080af6bb02ca890020.gif)](https://gyazo.com/171028f610f250080af6bb02ca890020)

・投稿機能　
投稿時には使った道具とお手入れの手順を入力して投稿することができます。
ユーザーの「この靴どのクリームでお手入れしたらいいんだろう」を解決したいので使った道具を見やすい形で投稿できるように工夫しています。
[![Image from Gyazo](https://i.gyazo.com/9b7ff2482fd2051ba4421d42afe0ba2e.gif)](https://gyazo.com/9b7ff2482fd2051ba4421d42afe0ba2e)

・編集機能
一度投稿した内容を編集することができます。
[![Image from Gyazo](https://i.gyazo.com/cc9bf7a0afdda3152c3800788cc295a7.gif)](https://gyazo.com/cc9bf7a0afdda3152c3800788cc295a7)

・削除機能
投稿を削除することができます。
[![Image from Gyazo](https://i.gyazo.com/16716472db8805afd7d57cc90eb81f0e.gif)](https://gyazo.com/16716472db8805afd7d57cc90eb81f0e)

・コメント機能
全てのユーザーの投稿にコメントすることができます。
CtoCのサービスであるためユーザー同士のコミュニケーションが不可欠だと考え実装しました。
[![Image from Gyazo](https://i.gyazo.com/9fbe28069c0cf939cef043af729fbd3e.gif)](https://gyazo.com/9fbe28069c0cf939cef043af729fbd3e)



実装予定の機能	 
・いいね機能
靴磨きを自己満足で終わらせないために必要な機能だと考えています。
・フォロー機能
フォローすることで他のユーザーの靴のエイジングも楽しむことができます。
・検索機能
自分の興味のある靴の情報を検索できる方が使いやすいアプリになると考えています。

データベース設計
[![Image from Gyazo](https://i.gyazo.com/c312385810986c28f3221b3e233b9991.png)](https://gyazo.com/c312385810986c28f3221b3e233b9991)


開発環境　
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code 



## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| profile            | text                | null: false             |
| profession         | text                | null: false             |
| size               | integer             |                         |

### Association

* has_many :recipes
* has_many :comments

## recipes table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| cream                               | text       | null: false       |
| procedure                           | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| recipe      | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :user
