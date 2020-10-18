## アプリケーション概要

### アプリケーション名 
  TechMatch

### コンセプト
  
  繋がるハードルを極端なまでに下げたエンジニアのためのマッチングアプリ。

  「セミナーや勉強会に1人で行くのは気が重い。マッチングアプリは何だか怪しそう。だけど、キャリアや業務、技術の事などエンジニアと話し合いたい事は山ほどある。」
  そんな少し奥手で慎重なエンジニアさんの背中を押すために開発したサービスです。

  また、サブテーマとして「もっと相手の内面を知った上でエンジニア採用を行いたい。」と考える会社の人事や社長さんにもメリットのあるサービスにしております。


## アプリケーションの利用方法

### URL(デプロイ)
デプロイ次第、記述します。

### 具体的な利用方法
サービス完成次第記述します。

### テスト用アカウント
ログインできるテスト用アカウントを用意次第、記述します。

### ローカルでの動作方法

以下の手順で問題なくローカル環境で動作できるかと思います。

% git clone https://github.com/maekawa-kazuma/techmatch.git
% cd techmatch
% bundle install
% yarn install

※ railsはバージョン6.0.0を利用しております。

## 要件定義

### 要件定義を行うにあたって目指した課題解決

エンジニアと繋がりたいという思いを抱いているエンジニア(特に未経験エンジニア)の「マッチングまでのハードルの高さ」を解消すること。
また、使用言語・業務形態・開発歴など多様なエンジニアが混在する中で、自分に合った人ではなかった...といったような「マッチングした際の満足度の低さ」を解消すべく要件定義を行いました。

### ①1対1のチャット機能(DM機能)
目的:マッチングしたいユーザーと労力の低いメッセージでやり取りできるようにするため。(マッチングのハードルを下げる役割)
詳細: 相互フォロー状態である場合のみ、1対1のトークルームでやり取りできる。また、JSによる非同期通信を用いてストレスを低減しています。

### ②メッセージ削除機能
目的: 間違えて送ってしまった情報を削除できるようにするため。
詳細: 自分が投稿したメッセージには、削除リンクが生成されるようにする予定です。

### ③ビデオ通話機能
目的: 実際に合うのが難しい(地理的・コロナ的問題など)あるいは、まだ合うのはちょっと不安といったユーザーの問題を解消する役割。
詳細: DMで繋がっているトークルームにて、専用ボタンのワンクリックでzoomに繋がる仕様。zoomのAPIを利用します。

### ④ユーザーのフォロー機能
目的: 相互フォローでないユーザーとのやり取りに制限をかけることで、アプリの安全性を高める役割。
詳細: ユーザーは気になった人にフォローリクエストを送ることができる。それに対して相手が許可をだすと、トークルームが作成されてメッセージでのやり取りが可能になります。
acts_as_folloerというgemを用いて実装します。

### ⑤ユーザー詳細機能
目的: 事前にユーザーの詳細情報を知る機会を設けることで、安心してコンタクトを取れるようにするため。自分のプロフィール情報を都度更新できるようにするため。
詳細: ユーザーの居住地・学んでいる言語・職種(SES,自社開発,フリーランスなど)・自己紹介文などを確認することができます。

### ⑥ユーザー編集機能
目的: 自分のプロフィール情報を都度更新できるようにするため。
詳細: 自己紹介文などを自由に編集できます。

### ⑦ユーザー(アカウント)削除機能
目的: サービスを利用しなくなったユーザーの情報を不用意に表示しないようにするため。
詳細: マイページの詳細に削除ボタンを設置する形で実装する予定です。

### ⑧ユーザー検索機能
目的: マッチングしたいユーザー、共通点が多く親近感の湧くユーザーを素早く見つける役割。
詳細: 言語の指定(rubyやphpやjavaなど)や職種指定(SES,自社開発,受託など)や開発歴(独学中、〇〇スクール在籍、実務◯年)etc..でフィルターをかけ、自分が繋がりたい人を見つけることができます。

### ⑨ユーザーレビュー機能
目的: その人の信頼性を可視化することで、悪質なユーザーとのマッチ率を減らすため。レビュー機能を設けることで、不適切な発言や行動を抑止効果を生むため。
詳細: 形式は、★による5段階評価＋コメントをできるようにする予定です。ただ人間レビューには、抵抗感を感じる人も多いかもしれないので工夫が必要になります。

### ⑩掲示板(タイムライン)作成機能
目的: 不特定多数に向けて募集をかけることで、マッチしたい人が手っ取り早く見つけられるようにするため。とにかく手っ取り早くマッチしたい、複数人とマッチしたいと考えているユーザー向けの機能です。
詳細: もくもく会や会食、企業セミナーといった多種多様なイベントへの呼びかけが行われることを想定しています。また、一緒にイベントに行く仲間を探す際にも利用できるようにします。
エンジニア向けイベント情報を発信しているconpassのAPIを利用して実装は行います。

### ⑪掲示板(タイムライン)詳細機能
目的: 掲示板の詳細情報を確認できるようにするため。
詳細: 掲示板一覧ページでは、提示していなかった細かな情報を表示する予定です。

### ⑫掲示板(タイムライン)編集機能
目的: 投稿ミスの修正や追記を可能にするため。
詳細: 自分が投稿した掲示板では、編集ボタンが現れるようにして編集ページに移れるようにします。

### ⑬掲示板(タイムライン)削除機能
目的: ボードに記述した呼びかけが必要なくなった際に、情報を削除できるようにするため。
詳細: 編集機能と同様、ボタンリンクから移れるようにします。

### ⑭ログイン・ログアウト機能
目的: ユーザーの情報を管理し、秘匿性を高めるため。
詳細: 新規登録では、「本名・メールアドレス・パスワード・職歴/学歴・居住地・学んでいる言語・利用目的・自己紹介欄など」を記入します。(登録はウィザード形式を採用)
ログイン時は、「メールアドレスとパスワード」を記入。facebookやtwitter・gooleログインも可能にする予定です。また、1人のユーザーが複数のアカウントを持つことができない仕組みを取り入れようと考えています。

### ⑮ログアウト機能
目的: 第3者の不正利用を防ぐため
詳細: ヘッダーにログアウトボタンを設置する形で実装します。

### ⑯通報機能
目的: サービスの利用目的に沿っていないユーザーの行動を制限するため。
詳細: ①不適切な投稿内容を見つけた際に、通報してもらう。→ ②サービス管理者側が審査をする。→ ③場合によっては投稿者のアカウントを凍結させる。といった流れの機能を実装予定です。

## 実装した機能についてのGiFと説明

### 今後実装する予定の機能

## DB設計

### usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
※プロフィール画像は、Active Storageで実装

#### Association
- has_many :entries
- has_many :rooms, through: entries
- has_many :messages
- has_one :details
- has_many :posts

### entriesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :room

### roomsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

#### Association
- has_many :entries
- has_many :messages
- has_many :users, through: entries

### messagesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

#### Association
- belongs_to :room
- belongs_to :user

### detailsテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| age           | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| occupation_id | integer    | null: false                   |
| genre_id      | integer    |                               |
| school        | string     |                               |
| experience_id | integer    |                               |
| language_id   | integer    |                               |
| interest_id   | integer    | null: false                   |
| pr            | text       | null: false                   |
| user          | references | null: false, foreign_key: true|

#### Association
- belongs_to :user

### postsテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| title      | string  | null: false |
| content    | text    | null: false |
| date       | date    |             |
| time_first | time    |             |
| time_end   | time    |             |
| people     | integer |             |

#### Association
- belongs_to :user
- has_many :post_tag_relations
- has_many :tags, through: post_tag_relations 

### post_tag_relationsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

#### Association
- belongs_to :post
- belongs_to :tag

### tagsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

#### Association
- has_many :post_tag_relations
- has_many :posts, through: post_tag_relations

### ER図

https://gyazo.com/37f3ad951c242b3106f98d287febc67d


