```sh
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $XAUTHORITY:/home/ubuntu/.Xauthority --net=host firefox
```