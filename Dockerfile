FROM python:3.11-slim-bookworm

# システムパッケージのインストール（ドライバー、ffmpeg等）
RUN apt update && apt install -y \
    wget \
    gnupg \
    curl \
    unzip \
    git \
    ffmpeg \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# ユーザー作成
RUN useradd -m -d /home/container container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# 基本的なPythonライブラリをプリインストール
RUN pip install --no-cache-dir \
    selenium \
    requests \
    beautifulsoup4 \
    webdriver-manager \
    pandas \
    numpy \
    aiohttp \
    pytz
