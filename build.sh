git submodule update --remote --checkout

docker build -t hoelshare/office-core:latest core
docker push hoelshare/office-core:latest

docker build -t hoelshare/office-ui:latest ui
docker push hoelshare/office-ui:latest
