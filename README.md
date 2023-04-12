# README


Project sử dụng:

* Ruby version: 2.7.5
  
* rails version: 7.0
  
* Đường dẫn admin: http://localhost:3000/admin
tk: admin@example.com
mk: password

* Đường dẫn user: http://localhost:3000

* Có sử dụng sidekiq để gửi broadcast cho room

* Có viết unit test cho send_message_job_test và messages_controller_test

Các bước cài đặt:

Cài thư viện
```shell
bundle i
```
Khởi tạo database
```shell
rails db:create db:migrate db:seed
```
Chạy rails serve
```shell
rails s
```
Chạy sidekiq
```shell
bundle exec sidekiq
```