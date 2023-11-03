# WebHomeProducts

Web/API Server on home for various my application

## 参考
+ Docker
+ Python
+ JavaScript
+ TypeScript
+ Node.js
+ Django
+ React
+ Flask
+ FIDO
+ OAuth
+ Open Connect ID
+ PostgreSQL
+ Nginx
+ Let's Encript
+ Certbot


## 背景
+ 散々しているアプリや技術を整理する場としてアウトプット基盤が必要.

## 目的
+ 様々なアウトプット基盤の構築
+ アウトプットドリブンによるインプットの質を上げる

## ロードマップ
| マイルストン | 内容 | 達成状況 |
| :-- | :-- | :-- |
| 0合目 | ドメイン名取得, 自宅ルータのルーティング | ◯ |
| 1合目 | DockerコンテナによるDjangoのAPPサーバー構築 & ローカル&ネットからの疎通確認 | ○ |
| 2合目 | WSGIのGUNICORNの設定(専用コンテナ立ち上げ) | 実行中 |
| 4合目 | NginxをリバースプロキシサーバにしてGUnicornにリダイレクトする設定を行う |  実行中 |
| 5合目 | GunicornのDjangoへのバインディング | 実行中 |
| 6合目 | Djangoの静的ファイル(html)にTypeScriptでコードしたReactをWebpackのバンドルコードを付与する(フロントエンド) ReactはGoLiveでデバッグ | - |
| 7合目 | NginxのLet's EncriptによるHTTPS化を強制 | 実行中 |
| 8合目 | メインホーム画面のUI設計&実装 | - |
| 9合目 | RDBSQL(PostgreSQL)の設計&実装 (テーブル, Column定義, 正規化) | - |
| 10合目 | ユーザーID, クレデンシャル属性の設計 | - |
| 10合目 | 識別・認証・認可 (パスワード+ワンタイムパスワード認証, FIDO認証, OAuth, Open Conect ID)の実装 | - |
| 8合目 | アカウント設定機能実装 | - |
| 9合目 | 日記機能実装 | - |
| 10合目 | Wiki機能実装 | - |
| 11合目 | 各サービス画面UIの設計実装 | - |
| 12合目 | 各サービス要WebAPIサーバの設計 | - |
| 13合目 | OAuthによる認可機能をAPIサーバに組み込む | - |
+ 残りは, 各サービスに応じて11合目, 12合目, 13合目を繰り返す.

## 機能要件
+ リバースプロキシ-の導入
+ インターネットのHTTPS暗号通信化
+ コンテナによるマイクロアプリケーション
+ データストアの導入
+ WebAPIによるマイクロコンテナ単位での各種サービス
+ ドメインの取得
+ DNSサーバーの設定
+ 自宅LANのルーティング
+ 識別・認証・認可 (FIDO認証機能, OAuth認可, Open Connect ID)
+ アカウント機能
+ ソーシャルログイン機能
+ パスワードとメールアドレスによるワンタイムパスワード認証の実装
+ ブログ機能
+ Wiki機能
+ 動画配信機能
+ 動画ストリーミング機能
+ プロダクト用Webページ
+ Azure連携
+ AWS連携


## 非機能要件
1. Python == 3.9.x
2. Django == 4.2.x LTS
3. PostgreSQL
4. Node.js == 20.9.0 LTS
5. npm > 9.5.1
6. React == 18.2.0
7. TypeScript == 5.1.3
8. Webpack == 5.89.0
9. webpack-cli == 5.1.4
10. babel-loader == 9.1.3
11. css-loader == 6.8.1
12. style-loader == 3.3.3
13. ts-loader == 9.5.0
14. @babel/core == 7.23.2
15. @babel/preset-env == 7.23.2
16. @babel/preset-react == 7.22.15
17. @babel/preset-typescript == 7.23.2
18. @types/node == 20.3.1
19. @types/react == 18.2.33
20. @type/react-dom == 18.2.14
21. ts-jest: 29.1.1
22. ts-lint: 4.5.1
23. Nginx
24. Let's Encrypt (Certbot)
25. FIND
26. OAuth
27. Open Connect ID

## 基本方針
+ 基幹Backendは, Djangoで開発
+ 各サービスはFlask/Express等の軽量WebAPIサーバーで実装
+ 自作できないサービスはWebAPI経由で取得.
+ Djangoが提供するhtmlにフロントエンドとしてReactを追加. (要Webpack)


# 各サービスごとの機能要件と非機能要件

