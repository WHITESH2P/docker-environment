```
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -f ubuntu.Dockerfile -t ubuntu-20.04_amd64:latest .
docker run --name ubuntu_amd64 -it ubuntu-20.04_amd64 
```

```
docker build -f ubuntu_aarch64.Dockerfile -t ubuntu-20.04_aarch64:latest .
docker run --name ubuntu_aarch64 -it ubuntu-20.04_aarch64
```
