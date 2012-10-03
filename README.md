勤怠メモ
======================
出勤時刻と退勤時刻を記録します。

作り方
------
## ローカル環境

### 準備するもの
+ ruby
+ rails
+ sqlite

### アプリ生成
    rails new kintaimemo

### タイムゾーン設定
config/application.rb に以下を追記

    config.time_zone = 'Tokyo'

### 勤怠 MVC生成
    rails g scaffold Attendance date:date in:time out:time note:string


### ローカルDBマイグレーション
    rake db:migrate

### 動作確認
サーバー起動

    rails s

ブラウザで画面表示  
<http://localhost:3000/attendances>

### Git初期化～コミット
    git init
    git add .
    git commit -m 'first commit'

## Heroku環境

### DB設定
sqliteを開発/テスト用DBとしてPostgresを運用DBとするようGemfileを修正

    group :development, :test do
      gem 'sqlite3'
    end
    group :production do
      gem 'pg'
    end

### Herokuアプリ生成
    heroku create

### Herokuアプリ名の任意指定
    heroku rename kintaimemo

### GitでHerokuにプッシュ
    git push heroku master

### Heroku DBマイグレーション(postgres)
    heroku run rake db:migrate

### Heroku動作確認
<http://kintaimemo.heroku.com/attendances>