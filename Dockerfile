# 使用 Ubuntu 作为基础镜像
FROM ubuntu:latest

# 设置工作目录
WORKDIR /app

# 更新包列表并安装必要的依赖（如果有）
# 如果你的二进制文件不需要额外的依赖，可以省略这一步
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 复制 PandoraHelper 二进制文件到 /app 目录
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# 赋予二进制文件执行权限
RUN chmod +x /app/PandoraHelper

# 检查 /app 目录结构和权限（可选，用于调试）
RUN ls -l /app

# 设置容器启动时运行的命令
CMD ["/app/PandoraHelper"]
