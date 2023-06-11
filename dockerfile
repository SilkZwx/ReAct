# ベースとなるDockerイメージの指定
FROM ubuntu:20.04

# タイムゾーン設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 必要なパッケージのインストール
RUN apt update && apt install -y \
    python3.8 \
    python3-pip

# ワーキングディレクトリの設定
WORKDIR /app

# 必要なPythonパッケージのインストール
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# アプリケーションのソースコードをコピー
COPY . .

CMD [ "bash" ]