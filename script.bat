echo "Criando as imagens"

docker build -t Ralfael/k8s-projeto1-app-base:1.0 -f backend/.
docker build -t Ralfael/k8s-projeto1-app-base:1.0 -f database/.

echo "Realizando o push das imagens"

docker push Ralfael/k8s-projeto1-app-base:1.0
docker push Ralfael/k8s-projeto1-app-base:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./service.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml