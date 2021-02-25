FROM python:3.8 as python-betterproto-builder

# install git
RUN apt update -y && \
    apt install -y \
    git

# install poetry
ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
ENV PATH="$POETRY_HOME/bin:$PATH"

# build python-betterproto wheel
WORKDIR /build
RUN git clone https://github.com/danielgtaylor/python-betterproto.git
WORKDIR /build/python-betterproto
RUN git checkout 59f5f88c0d5f21cfeb819399c3f72634e8422fe6 && \
    poetry build && \
    mv ./dist/betterproto-2.0.0b2-py3-none-any.whl /build/betterproto-2.0.0b2-py3-none-any.whl


FROM namely/protoc-all:1.34_3 as prod

RUN apt update -y && \
    apt install -y \
    git curl unzip \
    python3 python3-pip

RUN pip3 install --upgrade pip

# install buf https://buf.build/
ENV PREFIX="/usr/local"  \
    BUF_VERSION="0.36.0"

RUN curl -sSL \
    "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-$(uname -s)-$(uname -m).tar.gz" | \
    tar -xvzf - -C "${PREFIX}" --strip-components 1

# install python-betterproto
COPY --from=python-betterproto-builder /build/betterproto-2.0.0b2-py3-none-any.whl /build/betterproto-2.0.0b2-py3-none-any.whl
RUN pip3 install /build/betterproto-2.0.0b2-py3-none-any.whl[compiler]

# install protoc-gen-doc
RUN curl -sSL \
    "https://github.com/pseudomuto/protoc-gen-doc/releases/download/v1.4.1/protoc-gen-doc-1.4.1.linux-amd64.go1.15.2.tar.gz" | \
    tar -xvzf - -C "/usr/local/bin" --strip-components 1

# install grpc-web
RUN curl -sSL "https://github.com/grpc/grpc-web/releases/download/1.2.1/protoc-gen-grpc-web-1.2.1-linux-x86_64" -o ./protoc-gen-grpc-web-1.2.1-linux-x86_64 \
    && mv ./protoc-gen-grpc-web-1.2.1-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web \
    && chmod +x /usr/local/bin/protoc-gen-grpc-web

# install npm grpc-tools & ts
RUN npm install grpc-tools@1.10.0 grpc_tools_node_protoc_ts@5.1.3 --global

# Setup for makefile usage
WORKDIR /defs
ENTRYPOINT [ "buf" ]
CMD [ "generate" ]