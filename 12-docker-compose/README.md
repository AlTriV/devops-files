# Домашнее задание 10

- Создайте директорию `10-docker-compose`, в ней создайте файл `docker-compose.yaml`, который:
  - Создает образ контейнера Jenkins (за основу взять образ debian или ubuntu)
  - Использует ansible для установки и настройки Jenkins внутри образа
  - Запускает контейнер из созданного образа
  - В контейнере должен присутствовать настроенный проект для сборки word-cloud-generator и загрузки артефактов в Nexus
  - Пробрасывает порт Jenkins на порт 80 host-системы
  - Создает образ контейнера Nexus 3 (за основу взять образ debian)
  - Использует ansible для установки и настройки Nexus внутри образа
  - В контейнере должен присутствовать настроенный репозиторий для хранения артефактов сборки
  - Пробрасывает порт Nexus на порт 81 host-системы

# Полезные ссылки
- [Docker compose file specification](https://docs.docker.com/compose/compose-file/compose-versioning/)

# Команды docker-compose
- `docker-compose up`
- `docker-compose top`
- `docker-compose images`
- `docker-compose up --no-start`
- `docker-compose help`
- `docker-compose create`
- `docker-compose up --help`
- `docker-compose ps`
- `docker-compose down`
- `docker-compose up -d`
