Кто хочет стать миллионером?!
======

Всемирно известная игра, цель которой правильно ответить на 15 вопросов и выиграть миллион!  
Как и в настоящей игре в данном приложении есть несгораемые суммы выигрыша и три подсказки)  
Начать играть можно здесь:  
[![Игра](app/assets/images/logo.png "перейти на сайт")](http://tdwmillion.herokuapp.com)   
___

Для начала игры пользователю необходимо зарегистрироваться.  
Далее можно создавать новые игры, смотреть свою статистику, а также общий рейтинг игроков.  
Одна игра длится 35 минут, в течение которых нужно ответить на все вопросы.

![скрин игры](/public/game_screen.png "Экран игры")
___

В приложение добавлена возможность для пололнения вопросов (доступна только админам).  

![скрин загрузки вопросов](/public/add_question.png "")  

Также с помощью [rails_admin](https://github.com/sferik/rails_admin) в игре реализованы расширенные возможности админской части
 
![панель админа](/public/admin.png "")  
___

Приложение написано на Ruby on Rails версии 4.2.6 и Ruby 2.5.0.  
Перейдите в терминале в каталог с приложением и запустите следующие команды:  
```
bundle
```  
```
rails db:migrate
```  
```
rails db:seed
```  
```
rails s
```  
И приложение будет доступно на локальном сервере.
___

Приложение покрыто интеграционными и юнит тестами.  
Для тестов использованы:
* [Rspec](https://github.com/rspec/rspec-rails)
* [Capybara](https://github.com/teamcapybara/capybara)
* [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers)
* [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)  

Для запуска тестов в каталоге с приложением запустите команду:  
```
rspec spec/
```  
___

Для удобства пользования при ответе на вопросы  
взаимодействие между браузером и сервером происходит с помощью AJAX запросов,  
что позволяет меньше перезагружать страницу и ускорить процесс игры.

Наделение какого-либо пользователя правами админа возможно просто через консоль:  
```
rails c
```  
```
User.find(ID).toggle!(is_admin)
```
соответственно вместо 'ID' нужно подставить айдишник пользователя  
___

Данное учебное приложение является частью курса по Ruby on Rails от «Хорошего программиста».  
В продакшене настроено на работу с Heroku.

© http://goodprogrammer.ru
