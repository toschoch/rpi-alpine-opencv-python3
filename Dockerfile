FROM hypriot/rpi-alpine

COPY opencv-compile/get-pip.py /get-pip.py
RUN apk add --update --no-cache openblas python3 libjpeg libstdc++ libwebp libpng tiff jasper && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    python get-pip.py && \
    pip install numpy  --index-url=http://dietzi.ddns.net:3141/dietzi/stable --trusted-host dietzi.ddns.net

# install opencv
COPY opencv-compile/opencv/ /usr/
COPY opencv-compile/cv2.cpython-36m-arm-linux-gnueabihf.so* /usr/lib/python3.6/site-packages

RUN python -c "import cv2; print(cv2.__version__)"