# Inner Spark
Мобильное приложение-ассистент для формирования плана фитнес-тренировок.

Реализованный функционал:
- Авторизация и регистрация, профиль пользователя
- Система ролей: тренер и спортсмен
- Редактор упражнений и тренировок
- Отслеживание прогресса клиентов
- Чат между тренером и клиентом
- Рейтинг тренеров
- Прохождение назначенных тренировок клиентом

Собранное приложение для Android вы можете скачать [здесь](https://disk.yandex.ru/d/0pOrRACAe5hsZQ).<br>
Ссылка на репозиторий бэкенда - https://github.com/Cat-n-Code/fitness_app_backend

## Запуск из исходников
Для запуска требуется создать `.env` файл. Пример файла ниже:
```
# Здесь указывается адрес backend сервера
API_BASE_URL=http://localhost:8080
```

Для правильной работы приложение требуется запущенный backend сервер.
Вы можете воспользоваться нашим http://176.109.107.222:8080/, либо развернуть
свой собственный по [инструкции](https://github.com/Cat-n-Code/fitness_app_backend/blob/main/README.md).
