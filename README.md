# 自动获取四川电信IPTV组播地址和EPG节目单
---
# 项目功能

- 本项目使用deepseek编写的Python脚本
- 参考**supzhang**大佬的[get_iptv_channels](https://github.com/supzhang/get_iptv_channels)项目
- 通过IPTV线路获取电信IPTV组播地址、回放地址以及官方EPG节目单
- 在output目录生成DIYP格式sctv.txt,sctv.m3u,xmltv格式的epg.xml文件
- 配置文件路径为/app/config/config.json

# 使用范围
- 成都电信
- 其他地区应该也可以（未测试）

# 使用前提
- 必须获取到IPTV接口的IP地址
- 必须获取到UserID mac STBID STBType STBVersion Authenticator 信息
- 内网UDPxy服务器已搭好

# 使用方法
    docker run -d --name iptv -p 3001:3001 -v /path/config:/app/config --restart always 5778036/iptv-channels:latest

- 访问http://host:3001
![alt text](config.png)
![alt text](channels.png)