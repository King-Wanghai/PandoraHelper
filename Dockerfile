# 使用 frolvlad 提供的 Alpine + glibc 镜像作为基础镜像
FROM frolvlad/alpine-glibc:latest

# 设置工作目录
WORKDIR /app

# 下载并安装更高版本的 glibc，并清理缓存以减小镜像体积
ENV GLIBC_VERSION="2.34-r0"

RUN apk add --no-cache ca-certificates curl \
    && curl -fsSL -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && curl -fsSL -o /glibc-${GLIBC_VERSION}.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk /etc/apk/keys/sgerrand.rsa.pub /var/cache/apk/*

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
