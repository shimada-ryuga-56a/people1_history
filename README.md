# ぴぽの掲示板

### ■ サービスURL

https://people1-fansite.com/

![](app/assets/images/ogp_image.png)

## サービスについて
### ■ 概要
[PEOPLE 1](https://www.youtube.com/@PEOPLE1/videos)の非公式ファンサイトです。PEOPLE 1リスナーが情報を共有し合い、PEOPLE 1をより深く知ってもらうことを目的としています。

### ■ このサービスを作成した理由
PEOPLE 1の情報を集約するプラットフォームが欲しいと考えたからです。具体的には下記の情報です。
* PEOPLE 1のライブ情報・当日の出来事
* 楽曲やメンバーに関する豆知識・面白エピソード
* ラジオ、テレビ出演等、PEOPLE 1の今までの出来事全般

私はライブ後、その日のライブを振り返るために、ライブでの出来事をXで発信したり閲覧したりしています。またメンバーのSNSでの発言やインタビュー記事など、楽曲などに関する情報もこまめにチェックするようにしています。
しかしこれらの記録や情報は、他のSNSやWeb記事などに様々な場所に散乱しており、それらの情報を一括で閲覧することは非常に困難です。

こういった背景から、情報を一つにまとめられるプラットフォームを作成することを決意しました。

### ■ ユーザー層について
PEOPLE 1リスナー（10代〜20代）。特に、ファンクラブ会員〜ライブに行ったことがある・行ってみたいと思っている層。

### ■ サービスの利用イメージ
* ライブ後の帰り道に、セットリストや各楽曲のアレンジ・メンバーのMCの発言などを書き込みあう。
* いつでもメンバーや楽曲についての書き込むこともでき、PEOPLE 1を詳しく知るためのデータベースとして活用する。

### ■ ユーザーができること
| Xアカウントでの認証 | イベント一覧の閲覧・検索 |
|:-----------:|:------------:|
| [![Image from Gyazo](https://i.gyazo.com/89d9d04863f1e0c4f21630aca4ad2ff0.gif)](https://gyazo.com/89d9d04863f1e0c4f21630aca4ad2ff0) | [![Image from Gyazo](https://i.gyazo.com/3f8f267281ad4482d715ec626c8cca5a.gif)](https://gyazo.com/3f8f267281ad4482d715ec626c8cca5a) |

| 参加したイベントのブックマーク | イベント詳細の閲覧・セットリストの投稿 |
|:-----------:|:------------:|
| [![Image from Gyazo](https://i.gyazo.com/1a29a6478b8a782b0c2f466d4ca64426.gif)](https://gyazo.com/1a29a6478b8a782b0c2f466d4ca64426) | [![Image from Gyazo](https://i.gyazo.com/5cb92d51ab74f0268d15dbcf4f8e1e2d.gif)](https://gyazo.com/5cb92d51ab74f0268d15dbcf4f8e1e2d) |

| イベント・セットリストの各楽曲に対するコメント | 楽曲一覧の閲覧・検索 |
|:-----------:|:------------:|
| [![Image from Gyazo](https://i.gyazo.com/eb68b6092e4cc38fb8409af10e1a86f1.gif)](https://gyazo.com/eb68b6092e4cc38fb8409af10e1a86f1) | [![Image from Gyazo](https://i.gyazo.com/e66052648f9298b64fa9201135dc70a1.gif)](https://gyazo.com/e66052648f9298b64fa9201135dc70a1) |

| 楽曲詳細（ライブ演奏履歴・収録ディスク・SNS動画等）の閲覧 | メンバー一覧・詳細の閲覧 |
|:-----------:|:------------:|
| [![Image from Gyazo](https://i.gyazo.com/c5299bc42a4f7804fac581c97f0f034f.gif)](https://gyazo.com/c5299bc42a4f7804fac581c97f0f034f) | [![Image from Gyazo](https://i.gyazo.com/b72e6d8d52a57094cb953abc10a35d1c.gif)](https://gyazo.com/b72e6d8d52a57094cb953abc10a35d1c) |

| PEOPLE 1に関する出来事の時系列順での閲覧 | PEOPLE 1に関する出来事（ヒストリー）の投稿 |
|:-----------:|:------------:|
| [![Image from Gyazo](https://i.gyazo.com/861fd999c912b9ea5a6d6879c3f2b614.gif)](https://gyazo.com/861fd999c912b9ea5a6d6879c3f2b614) | [![Image from Gyazo](https://i.gyazo.com/ac112559b0c45db7b6b78075d9ae403e.gif)](https://gyazo.com/ac112559b0c45db7b6b78075d9ae403e) |

※未ログインのユーザーは、イベントと楽曲の一覧・詳細ページのみ閲覧可能です。

### ■ ユーザーの獲得について
* 自身のXアカウントで発信を行ったり、ヘッダーにXシェアボタンを設置したりして、Xからのユーザー獲得を狙います。
* SEO対策を行い、検索エンジンでPEOPLE 1の情報を調べた人のサイトへの誘導を図ります。

### ■ 似たようなサービスの差別化ポイント
* Wikipedia：アーティスト・楽曲・ライブの概要は書かれているが、載っている情報は広く浅い。自分が作成するアプリは、PEOPLE 1に関する情報が広く深く載っている状態にすることで差別化する。
* LiveFans：ライブのセットリストとちょっとした備考を見ることはできるが、そこまで詳細に書かれていない。 作成するアプリでは、MCでの発言や楽曲の細かいアレンジなども見ることができる。

## 技術について

### ■ 技術スタック
| カテゴリ | 技術 |
| ---- | ---- |
| フロントエンド | Rails 8.0.0, TailwindCSS, DaisyUI |
| バックエンド | Rails 8.0.0 (Ruby 3.2.3 ) |
| データベース | PostgreSQL |
| インフラ | Fly.io, Google Cloud Storage |
| 認証 | Device, X認証 |
| 開発環境 | Docker, VScode, GitHub |

### ■ 画面遷移図
[figma](https://www.figma.com/design/K0FtLTSiqRkLuPRGvnRRqA/2024%2F10%2F04-%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9C-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&node-type=canvas&t=sIxg1Yhi8O6TWRcj-0)（定期的に更新を行ってまいります）

### ■ ER図
[ER図](https://app.diagrams.net/#G1CLNCKOWylP9r_RxP_1x9GjDxdiBAlNUH#%7B%22pageId%22%3A%22R2lEEEUBdFMjLlhIrx00%22%7D)（定期的に更新を行ってまいります）
