FROM hypriot/rpi-alpine

ENV OPENCV_VERSION=3.3.0
#RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories
COPY ./get-pip.py /
RUN apk add --update --no-cache \
#  # --virtual .build-deps \
      build-base \
      openblas-dev \
      unzip \
      wget \
      cmake \
      python3 \
      python3-dev \
      # Wrapper for libjpeg-turbo
      libjpeg  \
      # accelerated baseline JPEG compression and decompression library
      libjpeg-turbo-dev \
      # Portable Network Graphics library
      libpng-dev \
      # A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (development files)
      jasper-dev \
      # Provides support for the Tag Image File Format or TIFF (development files)
      tiff-dev \
      # Libraries for working with WebP images (development files)
      libwebp-dev \
      linux-headers \
#      libavcodec-dev \
#      libavformat-dev \
#      libswscale-dev \
#      libv4l-dev \
#      libxvidcore-dev \
#      libx264-dev
      && ln -s /usr/bin/python3 /usr/bin/python && python get-pip.py && \
      pip install numpy  --index-url=http://dietzi.ddns.net:3141/dietzi/stable --trusted-host dietzi.ddns.net


##ENV CC /usr/bin/clang
##ENV CXX /usr/bin/clang++
#

RUN mkdir /opt && cd /opt && \
  wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && \
  unzip ${OPENCV_VERSION}.zip && \
  rm -rf ${OPENCV_VERSION}.zip

ENV OPENCV_INSTALL=/opencv/
RUN mkdir -p ${OPENCV_INSTALL}

RUN mkdir -p /opt/opencv-${OPENCV_VERSION}/build && \
  cd /opt/opencv-${OPENCV_VERSION}/build && \
  cmake \
  -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=${OPENCV_INSTALL} \
  -D WITH_FFMPEG=NO \
  -D WITH_IPP=NO \
  -D WITH_OPENEXR=NO \
  -D WITH_TBB=NO \
  -D BUILD_EXAMPLES=NO \
  -D BUILD_ANDROID_EXAMPLES=NO \
  -D INSTALL_PYTHON_EXAMPLES=NO \
  -D BUILD_DOCS=NO \
  -D BUILD_opencv_python2=NO \
  -D BUILD_opencv_python3=ON \
  -D PYTHON3_EXECUTABLE=/usr/bin/python3 \
  -D PYTHON3_INCLUDE_DIR=/usr/include/python3.6m/ \
  -D PYTHON3_LIBRARY=/usr/lib/libpython3.so \
  -D PYTHON_LIBRARY=/usr/lib/libpython3.so \
  -D PYTHON3_PACKAGES_PATH=/usr/lib/python3.6/site-packages/ \
  -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3.6/site-packages/numpy/core/include/ \
  .. && \
  make VERBOSE=1 && \
  make

#RUN  make install
