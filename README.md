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
  <img width="359" alt="スクリーンショット 2021-05-25 14 11 57" src="https://user-images.githubusercontent.com/65806682/119585163-19173f80-be05-11eb-8dfb-cd49cd0931a0.png">
<img width="788" alt="スクリーンショット 2021-05-25 14 13 43" src="https://user-images.githubusercontent.com/65806682/119585172-1f0d2080-be05-11eb-8440-85c7fe6f51cb.png">
<img width="1266" alt="スクリーンショット 2021-05-25 14 14 00" src="https://user-images.githubusercontent.com/65806682/119585179-22081100-be05-11eb-9d0a-95a43110aeca.png">
<img width="1117" alt="スクリーンショット 2021-05-25 14 14 39" src="https://user-images.githubusercontent.com/65806682/119585200-29c7b580-be05-11eb-92c0-67a3dc444615.png">
# 目次
- 使用技術
- ER 図
- 実装機能
- 工夫したポイント
- 苦労したポイント
- 今後の課題

# 使用技術
#### HTML/CSS/Sass/Javascript/Ruby on Rails/postgreSQL/AWS

##### バージョン
- ruby 2.7.2
- rails 'rails', '~> 6.0.3', '>= 6.0.3.6'
- PostgreSQL 13.2

# ER図

![er_5](https://user-images.githubusercontent.com/65806682/119584708-1bc56500-be04-11eb-81d9-610a3c9114d5.png)
# 実装機能
### ログイン（devise） 
| 　　　　　     |　 　     　     　|　　　　　　　　    　|                   |
|    ---        | ---           | ---               | ---              | 
| 言語選択         |     i18n          |日本語、英語、中国語（簡体）、タイ語                     
| ログイン情報      |部屋番号　　   |　　　　　　　　      |               |　　　　　
|   　          |    　　        |password           |                   |               
|              |      　        |認証方法カスタマイズ    | 新規登録を消去      |                  
|   　          |    　　        |                    |パスワード再設定機能の削除|
