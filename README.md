# Menneske syn
### コミュニケーションを助けるコミュニケーションツール
  
## 概要
#### 質問がランダムに表示され、質問について話し合い互いを知るきっかけを作るゲーム（対話タイム）
#### 自分だけのオリジナル質問を作成し、自分だけの質問集を作れる

![9d51609e22f8707c6f29c653aaee85eb](https://user-images.githubusercontent.com/63987719/84096992-43c68780-aa3e-11ea-890b-0dda20486298.png)
  
## App URL

### http://54.178.122.13
  

## 制作背景
#### インターネットの普及によってコミュニケーション力、思いやりの欠如といった社会的課題が加速しているように感じています。コミュニケーションを便利に、簡単にするためのアプリは多くみられますが、一方で、一つ一つのコミュニケーションを大事にする、質を上げるといったアプリはあまりみられないと思い、じっくり時間をとって関係性を深めたいという時に手助けできるサービスを作りたいと思ったのがきっかけです。身近な人やチームメイトの思考を互いに掘り下げていくことで、仕事やプライベートにおけるリアルなコミュニケーションの齟齬をできる限り減らし、良質な関係性を作るサポートをしたいと思いアプリを制作しました。
  

## テストアカウント
### メールアドレス： test@test
### パスワード： 123456
  

## アプリ機能
### 1. 画面上にランダムにトークトピックが表示される

![36e8b13d2b1713f12f123f099febfb9c](https://user-images.githubusercontent.com/63987719/84105107-4a5efa00-aa52-11ea-9bf0-43bce327a333.gif)

### 2. 質問作成機能
#### ログイン後マイページから自分だけの質問を作成できる
![5ff912727478e0e97bad068526939d40](https://user-images.githubusercontent.com/63987719/84098151-732ac380-aa41-11ea-95a7-8e17ab6a8b58.png)

### 3. お気に入り機能
#### デフォルトで作成してあるゲーム用の質問集からお気に入りの質問をマイページにピン留めできる
![6b4c87116272eaa1a7cb4bfa0084e5f3](https://user-images.githubusercontent.com/63987719/84098123-5f7f5d00-aa41-11ea-98e4-d5f637316ed7.png)

### 4. レスポンシブデザイン

![efe72c02f0f1aafb62e8394f6d31cb34](https://user-images.githubusercontent.com/63987719/84098072-4676ac00-aa41-11ea-830e-c049b74ef3a9.png)
  

## 使用技術
### Ruby on Rails
### Github
### AWS
  

## 課題や今後実装したい機能
#### 対話タイム用にルームを作成し、ルームに入ったメンバーのみでやりとりが行えるようにする
#### Javascriptを用いた非同期通信
#### 自身で作成した質問を対話タイムの質問項目に組み込めるようにする
  

## DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|

### アソシエーション
- has_many :myquestions, dependent: :destroy
- has_many :pins, dependent: :destroy
- has_many :questions, through: :pins

### questionsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null:false|

### アソシエーション
- has_many :pins, foreign_key: 'question_id', dependent: :destroy
- has_many :users, through: :pins

### myquestionsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null:false|
|user_id|integer|null:false  foreign_key: true|

### アソシエーション
- belongs_to :user

### pinsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false  foreign_key: true|
|question_id|integer|null:false  foreign_key: true|

### アソシエーション
- belongs_to :user
- belongs_to :question
