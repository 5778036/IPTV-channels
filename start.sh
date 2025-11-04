#!/bin/bash

# 设置错误处理：遇到错误时退出脚本
set -e

# 启动 cron 服务
echo "Starting cron service..."
service cron start

# 检查 cron 服务是否正常运行
if ! service cron status > /dev/null 2>&1; then
    echo "Warning: Cron service might not be running properly"
fi

# 设置 Flask 环境变量（如果尚未设置）
export FLASK_APP=${FLASK_APP:-app.py}
export FLASK_ENV=${FLASK_ENV:-production}

# 启动 Flask 应用
echo "Starting Flask application..."
exec flask run --host=0.0.0.0 --port=3001