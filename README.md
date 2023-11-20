# WebHomeProducts

Web/API Server on home for various my application

## 参考
+ Docker
+ DockerHub
+ Ansible
+ Github
+ Github Action
+ Kubernets(k8s)
+ Python
+ JavaScript
+ TypeScript
+ Node.js
+ Django
+ React
+ Flask
+ Google Authenticator(SSO)
+ FIDO(公開鍵基盤を用いた生体情報認証) ※ 課金必要なやらない
+ OAuth(認可サーバとアクセストークンによる認可用API作成)
+ Open Connect ID(要調査)
+ SAML (for クラウド) ※ 要検討(勉強レベル)
+ PostgreSQL
+ Nginx
+ Let's Encript(SSL証明書 CA)
+ Certbot

## 開発方式
+ CI/CD
+ イケイケベンチャー系

## 背景
+ 自己管理している散々アプリや技術を整理する場としてアウトプット基盤が必要.

## 目的
+ 様々なアウトプット基盤の構築
+ アウトプットドリブンによるインプットの質を上げる
+ CI/CDの実践
+ 認証系・暗号系の理解
+ DB/SQLの理解
+ AWS/Azure等のクラウド環境との連携を理解
+ ゆくゆくは, WebAPIを独立させてMobileに展開予定

## ロードマップ
| マイルストン | 内容 | 達成状況 | 達成日 |
| :-- | :-- | :-- | :-- |
| 0合目 | ドメイン名取得, 自宅ルータのルーティング | ◯ | - |
| 1合目 | DockerコンテナによるDjangoのAPPサーバー構築 & ローカル&ネットからの疎通確認 | ○ | - |
| 2合目 | WSGIのGUNICORNの設定(専用コンテナ立ち上げ) | ◯ | '23/11/20 |
| 4合目 | NginxをリバースプロキシサーバにしてGUnicornにリダイレクトする設定を行う |  ◯ | '23/11/20 |
| 5合目 | GunicornのDjangoへのバインディング | ◯ | '23/11/20 |
| 6合目 | NginxのLet's EncriptによるHTTPS化を強制 | 実行中 | - | 
| 7合目 | 基幹サイト, 各プロダクト, WebAPIに関するURIとコンテナの設計 | - | - | 
| 8合目 | メインホーム画面のUI設計&実装 | - | - | 
| 9合目 | k8s用コード作成 & Ansibleによる稼働リモートホストへの自動展開 | - | 
| 10合目 | RDBSQL(PostgreSQL)の設計&実装 (テーブル, Column定義, 正規化) | - | - | 
| 11合目 | ユーザーID, クレデンシャル属性の設計 | - | - | 
| 12合目 | 識別・認証・認可 (パスワード+ワンタイムパスワード認証)の実装 | - | - | 
| 13合目 | アカウント設定機能実装 | - | - | 
| 14合目 | 日記機能実装 | - | - | 
| 15合目 | Wiki機能実装 | - | - | 
| 16合目 | サービス画面UIの設計実装 | - | - | 
| 17合目 | サービス要WebAPIサーバの設計 | - | - | 
| 18合目 | サービスにOAuthによる認可機能をAPIサーバに組み込む | - | - | 
+ 残りは, 各サービスに応じてWebAPIコンテナ, WebUIの設計, アプリ内ルーティング設定を繰り返す.

## 機能要件
+ リバースプロキシ-の導入
+ インターネットのHTTPS暗号通信化
+ コンテナによるマイクロアプリケーション
+ データストアの導入
+ WebAPIによるマイクロコンテナ単位での各種サービス
+ ドメインの取得
+ DNSサーバーの設定
+ 自宅LANのルーティング
+ + アカウント機能
+ 識別・認証・認可 (ソーシャルログイン, 2要素認証, OAuth認可, [FIDO認証機能], [Open Connect ID])
+ ワンタイムパスワード認証の実装
+ ブログ機能
+ Wiki機能
+ 動画配信機能
+ 動画ストリーミング機能
+ プロダクト用Webページ
+ [Azure連携]
+ [AWS連携]


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
25. (FIND)
26. OAuth
27. (Open Connect ID)
28. Docker
29. Ansible
30. Github Action
31. DockerHub

## 基本方針
+ 基幹Backendは, Djangoで開発
+ 各サービスはFlask/Express等の軽量WebAPIサーバーで実装
+ マイクロサービスアプリを基本にWebAPIで機能追加
+ 自作できないサービスはバグリッククラウドのWebAPI経由で取得.
+ Djangoが提供するhtmlにフロントエンドとしてReactを追加. (要Webpack)


# 各サービスごとの機能要件と非機能要件

