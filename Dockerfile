# 使用 frolvlad 提供的 Alpine + glibc 镜像作为基础镜像
FROM frolvlad/alpine-glibc:alpine-3.14

# 设置工作目录
WORKDIR /app

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
