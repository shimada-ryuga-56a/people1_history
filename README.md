■ サービス概要
* PEOPLE 1というアーティストの、ライブ・楽曲の概要やエピソード、豆知識などが集約されているWebサイト。
* イメージとしては、WikipediaのPEOPLE 1の情報だけに特化したバージョン（特化している分、細かい情報も多い）。
* 情報はユーザーが自由に書き込むことができる。

■ このサービスへの思い・作りたい理由
* PEOPLE 1の面白エピソードやライブでの出来事をまとめておきたいと思ったから。
  自分はライブ後などに、[これ](https://x.com/ohkyoku/status/1748352890643910739)や[これ](https://x.com/ohkyoku/status/1840745301424148742)のように、メンバーの発言や楽曲のアレンジでどんなものがあったかを発信している。行動原理として、いいねをもらえる（承認欲求が満たされる）というのも確かにあるが、ライブの様子を鮮明に思い出せたり「へ〜そうなんだ！」となれたりする情報を知れると嬉しいのではないかと考えているためである。
* アーティストの豆知識を知るのが好きだったから。
  BUMP OF CHICKENの天体観測は、もともと「どっこいしょ」という仮タイトルで、サビの歌詞も「ファーストキッスは投げキッス、あなたのハートにどっこいしょ」だった。こういった面白い情報も一つにまとまっていたら、そのアーティストが好きな人にとっては嬉しいのではないかと考えていた。
* 実際にメンバーから褒めてもらったから。
  上記の思いから、独学時代に一度サイトの作成を試みたこともあり、[途中まで作ったものをメンバーに送りつけたら](https://x.com/thebadtenhours/status/1821501042254852116)「すごい」と言ってもらえた。この出来事から、本格的に作成したいと考えるようになった。

■ ユーザー層について
* PEOPLE 1リスナー。その中でも積極的に書き込みを行ったり情報を見に来たりしてくれるのは、ファンクラブ会員〜ライブに行ったことがある・行ってみたいと思っている層ではないかと考えている。
* 必然的に10代〜20代がターゲット。
* 「PEOPLE 1の情報」に絞っている理由として、
  * 「アーティストの豆知識がまとまっているサイト」よりも「PEOPLE 1の情報がまとまっているサイト」と限定した方が、狙った層に興味を持ってもらえそう
  * PEOPLE 1の世界観に合わせてUIを考えられそう
  
  などと考えたためである。

■ サービスの利用イメージ
* ライブ後の帰り道などで、セットリスト・各楽曲のアレンジ・メンバーのMCの発言などを書き込みあって、その日の様子を鮮明に記録することができる。
* またいつでもメンバーや楽曲についての書き込むこともでき、PEOPLE 1を詳しく知るためのデータベースとして活用することができる。

■ ユーザーの獲得について
* [X](https://x.com/ohkyoku)での宣伝。
* ユーザーの書き込みをXでも共有できるようにし、拡散を図る。
* SEO対策を行なって、PEOPLE 1のセットリストの情報等を調べた人のサイトへの誘導を図る。

■ サービスの差別化ポイント・推しポイント
【似たようなサービス】
* Wikipedia：アーティスト・楽曲・ライブの概要は書かれているが、載っている情報は広く浅い。自分が作成するアプリは、PEOPLE 1に関する情報が広く深く載っている状態にすることで差別化する。
* LiveFans：ライブのセットリストとちょっとした備考を見ることはできるが、そこまで詳細に書かれていない。 作成するアプリでは、MCでの発言や楽曲の細かいアレンジなども見ることができる。

■ 機能候補（優先度高：MVPリリース時まで／優先度低：本リリースまでor実装検討）
* ライブやイベント情報の大枠を登録できる、管理者ページ（優先度高）
* 全ユーザーが見ることができるページ（仮）
  * ライブ・イベント情報（優先度高）
  * 楽曲情報（優先度高）
  * メンバー情報（優先度低）
  * アーティスト全体に関する情報（優先度低）
  * 全イベント・楽曲リリース・その他の出来事を、時系列順に見ることができるページ（優先度低）
* 会員登録・認証機能（優先度高）ログイン後に情報の書き込みやふぁぼを送ることができる
* 通知のリアルタイム受信（優先度低）
* 誤った情報の通報機能（優先度低）通報があった情報は管理画面に通知される

■ 機能の実装方針予定
* Turboのbroadcastを用いた、ふぁぼのリアルタイム通知
* セットリスト登録や楽曲検索時の、オートコンプリート機能
* 認証機能については大きなカスタマイズは予定していないため、deviseでの実装を検討中
* 管理画面に関しては、rails-adminやactive-adminなどのgemを使用予定

### 画面遷移図
[figma](https://www.figma.com/design/K0FtLTSiqRkLuPRGvnRRqA/2024%2F10%2F04-%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9C-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&node-type=canvas&t=sIxg1Yhi8O6TWRcj-0)

### 未ログインでも閲覧または利用できるページ
以下の項目は適切に未ログインでも閲覧または利用できる画面遷移になっているか？
- [x] トップページ（未ログインでも利用可能）
- [x] ユーザー登録（サインアップ）機能（未ログインでも利用可能）
- [x] ログイン機能（未ログインでも利用可能）
	- [x]Google認証（未ログインでも利用可能）
	- [x]X認証（未ログインでも利用可能）

### ログイン後に利用可能なページ
- [ ] マイアカウント確認・編集画面
	- [ ] パスワード変更ボタン
		- [ ] パスワード変更のための専用ページ
	- [ ] メールアドレス変更ボタン
		- [ ] メールアドレス変更のための専用ページ
- [ ] ライブ一覧画面
	- [ ] ツアー一覧表示画面
		- [ ] 情報投稿・削除機能
		- [ ] ふぁぼ・ふぁぼ解除機能
- [ ] ライブ詳細画面
	- [ ] 情報投稿・削除機能
	- [ ] ふぁぼ・ふぁぼ解除機能
		- [ ] セットリスト登録・編集画面
- [ ] メンバー一覧画面
- [ ] メンバー詳細画面
	- [ ] 情報投稿・削除機能
	- [ ] ふぁぼ・ふぁぼ解除機能
- [ ] 楽曲一覧画面
- [ ] 楽曲詳細画面
	- [ ] 情報投稿・削除機能
	- [ ] ふぁぼ・ふぁぼ解除機能
- [ ] ヒストリー閲覧画面
	- [ ] 年ごとでの閲覧が可能
	- [ ] ヒストリー登録画面
	
### 管理者のみが閲覧できるページ
- [ ] ログイン画面
- [ ] トップページ
	- [ ] 通報確認機能
- [ ] 楽曲一覧画面
	- [ ] 楽曲追加画面
	- [ ] 楽曲情報編集画面
- [ ] ライブ一覧画面
	- [ ] ライブ情報編集画面
	- [ ] ライブ情報追加画面
	- [ ] ツアー一覧画面
		- [ ] ツアー情報編集画面
		- [ ] ツアー情報追加画面
- [ ] メンバー一覧画面
	- [ ] メンバー情報編集画面
- [ ] ヒストリー情報確認画面
	- [ ] ヒストリー情報編集画面

### メールアドレス・パスワード変更確認項目
以下の項目は直接変更できるものではなく、一旦メールなどを介して専用のページで変更を行うよう画面を遷移させる
- [x] メールアドレス
- [X] パスワード

### 各画面の作り込み
画面遷移だけでなく、必要なボタンやフォームが確認できるくらい作りこめている
- [x] 作り込みはある程度完了している（Figmaを見て画面の作成ができる状態にある）
	
### その他
* フォロー機能は実装しない予定（ユーザーごとの発信情報を見るページは作成しないため）

### ER図
https://drive.google.com/file/d/1CLNCKOWylP9r_RxP_1x9GjDxdiBAlNUH/view?usp=sharing
