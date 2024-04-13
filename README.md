# nvim

docker build command
```
docker build --no-cache -t nvim .
```

docker run command
```
docker run --rm -it -v $HOME:$HOME --workdir=$(pwd) nvim [filenme]
```
