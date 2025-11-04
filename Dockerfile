# 基于的基础镜像
FROM python:3.11.6-slim-bullseye

# 设置环境变量
ENV PYTHONUNBUFFERED=1 \
    FLASK_APP=app.py \
    FLASK_ENV=production \
    TIME_ZONE=Asia/Shanghai \
    LC_ALL=C.UTF-8

# 设置工作目录
WORKDIR /app

# 先复制 requirements.txt 并安装依赖
COPY requirements.txt .

# 安装系统依赖和 Python 包
RUN apt-get update && apt-get install -y --no-install-recommends cron \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && pip install --no-cache-dir -r requirements.txt \
    # 修复 DES3.py 文件
    && sed -i '84,85 s/^/#/' /usr/local/lib/python3.11/site-packages/Crypto/Cipher/DES3.py \
    # 设置时区
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
    && echo $TIME_ZONE > /etc/timezone

# 复制应用代码
COPY . .

# 暴露端口
EXPOSE 3001

# 设置启动脚本权限
RUN chmod +x /app/start.sh

# 使用启动脚本作为容器的入口点
CMD ["/bin/bash", "/app/start.sh"]