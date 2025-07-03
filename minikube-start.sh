#!/bin/bash
# minikube-start.sh

# Активировать Docker окружение Minikube
eval $(minikube docker-env)

# Сборка Django образа
docker build -t django-app-image ./django_app

# Применение конфигураций Kubernetes
kubectl apply -f k8s/postgres/pvc.yaml
kubectl apply -f k8s/postgres/deployment.yaml
kubectl apply -f k8s/postgres/service.yaml
kubectl apply -f k8s/django/deployment.yaml
kubectl apply -f k8s/django/service.yaml

# Открытие dashboard
minikube dashboard &

# Открытие приложения в браузере
minikube service django-service
