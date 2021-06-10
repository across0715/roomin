# アプリ名: :bellhop_bell: roomin 

<h4> URL: https://roomin.herokuapp.com</h4>

# :thinking: どんなアプリか
ホテルでルームサービスを頼むときに使えるアプリです

# なぜ作ったのか？
ホテルで働いてる時、お客さんの５０％以上が全世界からきた外国人でしたが、<br>
多くの人が日本人にはわかりづらい英語のアクセントを持っていてコミュニーケーションとるのが難し時が多く、:exploding_head:<br>
（例えばとても忙しいのにだったの毛布一枚が欲しいとの話を電話で10分もしゃべらないといけなかったりする場面も度々ありました、）<br>

各言語で備品の名前があり、写真も入ってる注文アプリがあればお客さんは簡単にルームサービスができるし<br>
従業員も無駄が減るので仕事面で効率が上がると思いこのアプリを制作してみました。<br>
オリピックを迎えてはいるものの、コロナの影響で従業員を減らしているホテルがあるなら<br>
使って頂きたいと思います。


# イメージ画像
<img width="347" alt="スクリーンショット 2021-05-31 17 36 09" src="https://user-images.githubusercontent.com/65806682/120165773-e02cff80-c236-11eb-9b5e-f9a14260966b.png"><img width="355" alt="スクリーンショット 2021-05-31 17 08 08" src="https://user-images.githubusercontent.com/65806682/120162721-a3133e00-c233-11eb-88a0-372b61ccf6d8.png">

<img width="1188" alt="スクリーンショット 2021-05-31 16 24 51" src="https://user-images.githubusercontent.com/65806682/120162716-a1497a80-c233-11eb-9acb-fad635e2e0ac.png">
<img width="1190" alt="スクリーンショット 2021-05-31 16 24 12" src="https://user-images.githubusercontent.com/65806682/120162696-9b539980-c233-11eb-943d-4bb4b831b8cf.png">





# 目次
- 使用技術
- ER 図
- 実装機能
- 工夫したポイント
- 苦労したポイント
- 今後の課題
- その他の開発アプリ
# 使用技術
#### HTML/CSS/Sass/Javascript/Ruby on Rails/postgreSQL/AWS

##### バージョン
- ruby 2.7.2
- rails 'rails', '~> 6.0.3', '>= 6.0.3.6'
- PostgreSQL 13.2

# ER図

![er_f](https://user-images.githubusercontent.com/65806682/119762362-8223b380-bee8-11eb-9e72-3f23f8f39f7a.png)

# 実装機能
## `ユーザー`

|ログイン（devise） 　　　　　     |　 　     　 |　　　　　　　　    　|                
|    ---        | ---        | ---               |    
|ログイン情報    |部屋番号　　  |　　　　　　　　      |              
|   　         |password     |                   |        
|              |認証方法カスタマイズ    | 新規登録を消去      |       
|   　         |    　　             |パスワード再設定機能の削除|     
|言語選択      |     i18n   |日本語、英語、中国語（簡体）、タイ語、フランス語 |      

|備品申し込み|　 　     　 |　　　　　　　　    　|                   |
|    ---        | ---        | ---               | ---              |   
|備品の種類　     |部屋、風呂場、カウンター別に分類|                 |                    |
| 　　　　　     |備品オーダーボタン　　 　     　 |　　　　　　　　    　|                   |
| 　　　　　     |確認画面　　|　　　　　　　　    　|                   |
| 　　　　　     |管理者へのメール通知機能(Action Mailer)|管理者のメールアカウント（gmail)|                   |
|              |                                   |メール本文 |部屋番号、名前、備品の名前＋個数のセットに入るように装着|


|問い合わせフォーム |　 　     　 |　　　　　　　　    　|                  
|    ---        | ---        | ---               |
|申し込みフォーム|                 |                  | 
|確認画面                      | | | 
|投稿機能                      |データべースには保存しない |メール通知のみ | 
|管理者へのメール通知機能   |管理者のメールアカウント  |gmail  |
|                     |メール本文              |内容    | 
|                     |                      |画像      |        
|                     |                      |部屋番号と名前  |  
## `管理者（Active Admin)`

|パスワード発行（アカウント作成） 　　　　　     |　 　     　 |　　　　　　　　    　|                  
|    ---        | ---        | ---               |
|ユーザーアカウントを作成する個数   |　 　     　 |　　　　　　　　    　|               
|パスワードのPDF生成ボタン 　　　　|ユーザーアカウントの作成  |パスワードはランダム生成|                   
| 　　　　　        　     　 |　　　　　　　　    　|有効期限１ヶ月        |       
| 　　　　　  　 　     　 |QRコードの作成 　　    |アプリのURL、パスワード付き|  
| 　　　　　    　     　 |PDFの作成　　　　　　　|QRコード             |   
| 　　　　　     |　 　     　　　　　　　　    　|アプリのURL、パスワード   |    
| 　　　　　     |　 　     　　　　　　　    　|有効期限設定         |     

|備品管理機能 |　 　                |    
|    ---        | ---        |  
|               |備品投稿  |
|               |備品編集               |
|               |備品一覧               |
|               |詳細画面               |

|注文管理機能 |　 　    　　　　　　  |       |              
|    ---          | ---               | ---        |
|                 |編集機能 |対応状況|
|                |         |対応指示した従業員の名前 | 
|                |         |対応した従業員の名前 |
|                |一覧表示               |       |
|                | 詳細          |       |
   

|従業員の管理機能 |　 　    　　　　　　  |       |              
|    ---          | ---               | ---        |
|                 |作成 |  |
|                |一覧      |          | 
|                |編集       |表示非表示 |


# 工夫したポイント
#### パスワード発行（アカウント作成） 、認証方法カスタマイズ 
- 新く作られたアカウントの有効期限は１ヶ月にしました。ユーザーはホテルの宿泊者なのでactivate（ログイン）できてからは１週間後にアカウントは自動的に無効になるようにしました。
- 管理者が最初のアカウント生成のときにランダムで作られたpasswordをQRコードに入れて<br>
  ユーザーはQRコードだけでログインできるようにしました。（個人を特定するために部屋番号と名前の入力は必要です。）
#### 言語選択  i18n
- ５カ国の言語でアプリが利用できるようにしました。

# 苦労したポイント
- ログインの認証をパスワードのみいにしたかったですが，ユーザーを識別するために必要な email の代わりのものが必要だったので<br>
username をemail の代わりの認証方法に選択しました。ホテルのurlをベースに連番（16進数の）を作ってそこにランダムな6文字を追加したものをpasswordに
そのpasswordの最初からの６文字をusernameに使えるようにしました。ユーザーがpassword を入れたら自動でログインフォームのusername欄も埋まるようにし、ログインフォームのusername欄は
hiddenにして手軽にログインできる印象を与えました。

# 今後の課題
- 最初から貸し出せる備品の個数を入れておいて０になったら自動的に"在庫なし"に変わるようにしたいと思います。
- 実際に貸し出した各備品の個数を集計できるようにしたら、ホテルの経費削減のために役に立つかもしれないと思います。

# その他のアプリ
### 実案件んの管理者ページ全てを実装
- ３人の共同開発に参加、一人はリーダ役、も一人はユーザーを自分は管理者を担当。。。。
### 詳細説明。。。。。
#### 
![Kapture 2021-06-10 at 13 45 56](https://user-images.githubusercontent.com/65806682/121466415-5e856080-c9f2-11eb-857f-205f4fad8ebd.gif)




