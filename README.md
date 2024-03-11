# Flutter News App

Данный проект является мобильным приложением для просмотра новостных статей. Для стабильной подгрузки новостей следует использовать VPN.
![Главный экран приложения](https://github.com/Bogdan108/flutter_news/blob/flutter-hw2-hse/screenshots/additional_page.png)
![Экран с избранными новостями](https://github.com/Bogdan108/flutter_news/blob/flutter-hw2-hse/screenshots/main_page.png)

Главный экран приложения
## Используемые пакеты

- cached_network_image: ^3.3.1
- dio: ^5.4.0
- equatable: ^2.0.5
- flutter:
  sdk: flutter
- flutter_bloc: ^8.1.3
- internet_connection_checker: ^1.0.0+1
- flutter_localizations:
  sdk: flutter
- shared_preferences: ^2.2.2
- url_launcher: ^6.2.4
- intl: ^0.18.1
- json_annotation: ^4.8.1
- и другие...

## Описание проекта

Реализован основной экран с отображением списка новостных статей. Для обновления списка необходимо потянуть экран сверху вниз, при каждом обновлении приложение сохраняет список из новостей, при отсутсвии интернета приложение подгружает список из локального хранилища.
На дополнительном экране реализовано отображение названия статьи, фото, описания и содержания, а также кнопка для перехода в браузер.

Приложение поддерживает светлую и темную тему, все шрифты и стили используются из основной темы приложения. Добавлена интернационализация.
При разработке использовался пакет json_serializable. Код отформатирован, при команде `dart format --output=none --set-exit-if-changed` ошибок нет. Правила flutter_lint включены.
![](https://github.com/Bogdan108/flutter_news/blob/main/screenshots/dart_format.png)

К проекту прикреплены APK-файлы. Проект работает на Android и iOS платформах.
![](https://github.com/Bogdan108/flutter_news/blob/main/screenshots/apk_build.png)
