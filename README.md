勤怠メモ
==========
作り方ログ
----------

ローカルにsqliteの準備  

アプリ生成  
    rails new kintaimemo

タイムゾーン設定  
config/application.rb  
    config.time_zone = 'Tokyo'

勤怠 MVC生成  
    rails g scaffold Attendance date:date in:time out:time note:string

ローカルDBマイグレーション(sqlite)  
    rake db:migrate

ローカルサーバー起動  
    rails s

ローカル動作確認  
<http://localhost:3000/>  
<http://localhost:3000/attendances>  

Gitコミット  
    git init
    git add .
    git commit -m 'first commit'


###Heroku対応

DBにPostgresを指定  
Gemfile  
    group :development, :test do
        gem 'sqlite3'
    end
    group :production do
        gem 'pg'
    end

Herokuアプリ生成  
    heroku create

Herokuアプリ名の任意指定  
    heroku rename kintaimemo

GitでHerokuにプッシュ  
    git push heroku master

Heroku DBマイグレーション(postgres)  
    heroku run rake db:migrate

Heroku動作確認  
<http://kintaimemo.heroku.com/>  
<http://kintaimemo.heroku.com/attendances>  
