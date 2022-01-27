## Evenote
由来：イベントを記録するサイトなので「Event」+「Note」を組み合わせました。

## サイト概要
ライブ・舞台・展覧会等の様々なイベント情報を記録するサイト。

＜目的＞<br>
  イベントのチケット管理、グッズ購入情報、当日の写真など<br>
  参加するイベント情報を一元管理することを目的としている。<br>
  また、イベント情報の発信・共有も行うことができます。

＜機能＞<br>
- 登録機能<br>
    チケット登録：<br>
      参加したいイベントのチケット情報（申し込み日・当選日・支払い期限日等）を登録する事ができる。<br>
    イベント登録：<br>
      イベントの開催日時や時刻、場所等を登録する事ができる。<br>「公開する」で登録すると「2.検索の2-3：イベント一覧」に表示される。<br>公開するメリットしては同じイベントに参加する人を見つけてもらいやすくなるため、<br>同じ趣味の人と繋がることができる。<br>
    アルバム登録：<br>
      イベント当日の写真を登録し、アルバムにして管理することができる。

- メール機能<br>
  登録したチケット情報の申し込み日・当選日・支払い期限日の前日にメールが送信される。

- 投稿機能<br>
  参加したイベント情報を発信することができる<br>投稿時にタグ付けし、タグ検索も可能。<br>投稿は以下三つのページがある。<br>
    - 投稿一覧<br>フォロしているユーザーの投稿を見ることができる。<br>
    - 検索<br>
        - 投稿一覧　　　全ユーザの投稿を見ることができる。タグ検索が可能。<br>
        - ユーザー一覧　利用ユーザーを検索することができる。<br>
        - イベント一覧　イベント登録時に「公開する」としたイベント情報一覧を見ることができる。<br>イベント名で検索することができる。

- いいね・コメント機能
    投稿に対していいねやコメントすることができる。

- フォロー機能
    利用しているユーザーをフォローすることができる。

- DM機能
    利用しているユーザー同士でメッセージを送る事ができる。

- 通知機能
    フォローされた時、いいねコメントが来た時に通知される。

### サイトテーマ
- イベントの予約状況や参加するイベント情報を記録する。
- 参加したイベント情報を発信し、趣味を共有することができるSNSサイト。

### テーマを選んだ理由
私はライブが好きでよく行っていたのですがチケットを取る際、<br>
チケット代を払うのを忘れそうになって肝を冷やした経験があります。<br>
<br>
近年、イベント業界は少人数制を行うため、チケット予約制を導入する所が増えています。<br>
「チケットの申込開始日や支払い期限日を忘れていけなくなった」という状況をなくし、<br>
イベントに参加するまでを楽しく、そして大事なことは忘れないよう管理するサイトがあれば良いなと思いこのテーマにしました。<br>
<br>
また、参加イベントの情報を発信することで、共通の趣味の人と繋がることができれば<br>
イベントの思い出も増えるのではないかと思い、SNS要素もあるサイトにしました。<br>

### ターゲットユーザ
- 参加するイベント情報を記録しておきたい人
- 同じ趣味の人と繋がりたい人

### 主な利用シーン
- チケットを購入する前〜イベント参加時まで
- 参加したイベント情報を発信・共有したい時
- 過去のイベント参加状況を見返したい時

## 設計書
<string>ER図</strong>
<img width="995" alt="Evenote -ER" src="https://user-images.githubusercontent.com/92415574/151269871-46c6d47f-13ed-4d86-8d09-c746561191b9.png">

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1U9ZZfLpMVLzkXdxFr7WcQqLX9sSvPXXLqc60NMuGnRQ/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9