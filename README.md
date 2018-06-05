RasperryPi Alpine OpenCV Python3
===============================
author: Tobias Schoch

Overview
--------

Base image for machine vision work in python on rasperry pi. 


Change-Log
----------
##### 0.0.1
* initial version


Installation / Usage
--------------------
clone the repo:

```
git clone <git-url>
```
build the docker image
```
docker build . -t rpi-alpine-opencv-python3
```

Example
-------

run a container of the image
```
docker run -v ... -p ... rpi-alpine-opencv-python3
```