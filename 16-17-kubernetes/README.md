# Домашнее задание 12

- В репозитории с домашними заданиями создайте каталог `12-kubernetes`
- Создайте манифесты для следующих объектов:
  - Deployment для запуска в k8s кластере приложения word-cloud-generator из вашего образа wcg, хранящегося в GitHub registry (ghcr.io)(Дз 11). Необходимо использовать ImagePullSecret для загрузки образа из GitHub registry.** ImagePullPolicy должно быть always.
  - Service для доступа к приложению
  - Ingress для доступа к приложению снаружи кластера

## Примечания
** ImagePullSecret сохранять в манифесте не надо

# Полезные ссылки

- [Документация K8s](https://kubernetes.io/docs/tutorials/)
- [Установка Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [Установка kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Старые версии Minikube](https://github.com/kubernetes/minikube/tags)
- [CSI drivers](https://kubernetes-csi.github.io/docs/drivers.html)