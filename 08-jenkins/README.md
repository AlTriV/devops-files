# Скрипт для сборки проекта

```bash
export GOPATH=$WORKSPACE/go
export PATH="$PATH:$(go env GOPATH)/bin"

go get github.com/tools/godep
go get github.com/smartystreets/goconvey
go get github.com/GeertJohan/go.rice/rice
go get github.com/wickett/word-cloud-generator/wordyapi
go get github.com/gorilla/mux

sed -i "s/1.DEVELOPMENT/1.$BUILD_NUMBER/g" static/version

GOOS=linux GOARCH=amd64 go build -o ./artifacts/word-cloud-generator -v 

md5sum artifacts/word-cloud-generator
gzip artifacts/word-cloud-generator
ls -l artifacts/
```

# Домашнее задание 6

- В репозитории `devops-hometasks` создайте директорию `06-jenkins`
- C помощью Vagrant создайте виртуальную машину `jenkins.vm` основанную на Debian
- Напишите свою роль для установки Jenkins. Роль должна содержать:
  - Конфигурацию системы
  - Установку необходимых плагинов
  - Создание задачи
  - Создание необходимых credentials
- Для примера можно использовать роли [ansible-jenkins](https://github.com/emmetog/ansible-jenkins), [ansible-role-jenkins](https://github.com/geerlingguy/ansible-role-jenkins)
- На машине jenkins.vm установите Jenkins с помощью вашей ansible роли. 

# Полезные ссылки

- [Установка Jenkins](https://jenkins.io/doc/book/installing/)
- [Настройка агентов Jenkins](https://kamaok.org.ua/?p=2929)
- [Репозиторий приложения](https://github.com/wickett/word-cloud-generator)
- [Библиотека ролей для ansible](https://galaxy.ansible.com)
- [Роль для настройки jenkins](https://github.com/emmetog/ansible-jenkins)
  
- [Описание Core API](https://wiki.jenkins.io/display/JENKINS/Remote+access+API)
- [REST-API для плагина Credentials](https://support.cloudbees.com/hc/en-us/articles/360030526992-How-to-manage-Credentials-via-the-REST-API)
- [Красивый вывод Jenkins REST-API](http://automation-remarks.com/kak-prruchit-jenkins-api/)
- [Python API](https://jenkinsapi.readthedocs.io/en/latest/using_jenkinsapi.html)
- [Установка плагинов через API](https://www.anycodings.com/1questions/1072214/how-to-install-plugins-in-jenkins-with-the-help-of-jenkins-remote-access-api)
