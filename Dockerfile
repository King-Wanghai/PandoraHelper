# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 安装必要的依赖和 glibc
ENV GLIBC_VERSION="2.35-r1"

RUN apk add --no-cache \
    ca-certificates \
    && apk add --no-cache --virtual .build-deps curl \
    && curl -fsSL -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && curl -fsSL -o /glibc-${GLIBC_VERSION}.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && apk del .build-deps

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 设置环境变量，确保应用使用 glibc
ENV LD_LIBRARY_PATH /usr/glibc-compat/lib

# 检查 /app 目录结构和权限
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
