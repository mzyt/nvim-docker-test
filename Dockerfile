FROM alpine:latest

RUN apk add --no-cache \
        git \
        make \
        gcc \
        g++ \
        musl-dev \
        cargo \
        nodejs \
        python3 \
        unzip \
        cmake \
        bash \
        build-base \
        coreutils \
        curl \
        gettext-tiny-dev \
    && git clone https://github.com/neovim/neovim /tmp/nvim \
    && cd /tmp/nvim \
    && make CMAKE_BUILD_TYPE=Release \
    && make install \
    && rm -rf /tmp/nvim 

COPY init.lua /root/.config/nvim/init.lua

RUN nvim +:q

ENTRYPOINT ["nvim"]
