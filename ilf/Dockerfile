
FROM curlimages/curl-base as downloader

WORKDIR /app/downloads

RUN curl -LO https://github.com/TinyCC/tinycc/archive/refs/heads/mob.zip

RUN curl -LO https://mirrors.ibiblio.org/gnu/gsl/gsl-2.8.tar.gz

FROM gcc:15.2.0-trixie as builder

WORKDIR /app

COPY --from=downloader /app/downloads /app/downloads

RUN apt-get update && apt-get install -y libffi-dev libgmp-dev libmpfr-dev libmpc-dev make autoconf automake texinfo pkg-config libxml2-dev glib-2.0-dev libgio-2.0-dev

RUN unzip downloads/mob.zip && \
    cd tinycc-mob && \
    ./configure && \
    make -j$(nproc) && \
    make install

RUN tar -xzf downloads/gsl-2.8.tar.gz && \
    cd gsl-2.8 && \
    ./configure && \
    make -j$(nproc) && \
    make install

RUN ldconfig

COPY src/ ./src/
COPY test/ ./test/
COPY Makefile .

RUN make clean && make eval_server

CMD [ "./eval_server" ]
