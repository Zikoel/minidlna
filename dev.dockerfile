# Dockerfile to sandobox build

FROM debian:stretch

LABEL Elia Mazzuoli <zikoel@gmail.com>

RUN echo 'deb http://ftp.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.conf 

RUN apt-get update && \
    apt-get -y install build-essential autotools-dev autoconf automake autopoint

RUN apt-get -y install \
    libexif-dev \
    libjpeg-dev \
    libid3tag0-dev \
    libflac-dev \
    libvorbis-dev \
    libsqlite3-dev \
    libavformat-dev \
    libavformat57 \
    ffmpeg \
    libavifile-0.7-dev \
    libavcodec-dev \
    libavutil-dev

WORKDIR /minidlna

COPY . .

RUN ./autogen.sh && ls
# RUN ./configure
# RUN cat configure
# RUN echo "-------------"
# RUN cat build
# RUN echo "-------------"
# RUN make

CMD ["bash"]
