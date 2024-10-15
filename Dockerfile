# 使用 Alpine 作为基础镜像
FROM alpine:latest
WORKDIR /app

# 安装 glibc 兼容包
RUN apk --no-cache add ca-certificates \
    && apk --no-cache add --virtual .build-deps curl \
    && curl -Lo glibc-2.36-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.36-r0/glibc-2.36-r0.apk \
    && curl -Lo glibc-bin-2.36-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.36-r0/glibc-bin-2.36-r0.apk \
    && apk add --no-cache glibc-2.36-r0.apk glibc-bin-2.36-r0.apk \
    && /usr/glibc-compat/bin/ldconfig \
    && apk del .build-deps \
    && rm -rf glibc-2.36-r0.apk glibc-bin-2.36-r0.apk

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
