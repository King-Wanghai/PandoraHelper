# 使用 frolvlad 提供的 Alpine + glibc 镜像作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 下载并安装更高版本的 glibc
ENV GLIBC_VERSION=2.34-r0

RUN apk add --no-cache ca-certificates \
    && apk add --no-cache --virtual .build-deps curl \

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
