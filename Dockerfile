# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 安装 libc6-compat 以支持 glibc 二进制文件
RUN apk add --no-cache libc6-compat

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限（可选，用于调试）
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
