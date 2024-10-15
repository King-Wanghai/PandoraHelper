# 使用 Alpine 镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 安装证书和curl
RUN apk add --no-cache ca-certificates

# 安装 curl 和临时依赖
RUN apk add --no-cache --virtual .build-deps curl

# 下载 glibc 的公钥
RUN curl -fsSL -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

# 下载 glibc
ENV GLIBC_VERSION=2.34-r0
RUN curl -fsSL -o /app/glibc-${GLIBC_VERSION}.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk

# 列出下载的 glibc 文件
RUN ls -l /app/glibc-${GLIBC_VERSION}.apk

# 安装下载的 glibc
RUN apk add --no-cache --force-overwrite /app/glibc-${GLIBC_VERSION}.apk

# 删除 apk 文件和公钥
RUN rm -rf /app/glibc-${GLIBC_VERSION}.apk /etc/apk/keys/sgerrand.rsa.pub

# 删除临时依赖
RUN apk del .build-deps

# 清理缓存
RUN rm -rf /var/cache/apk/*

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
