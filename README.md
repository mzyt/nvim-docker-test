# nvim-docker-test

docker build command
```
docker build --no-cache -t nvim-docker-test .
```

docker run command
```
docker run --rm -it -v $HOME:$HOME --workdir=$(pwd) nvim-docker-test [filenme]
```
