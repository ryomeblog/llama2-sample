# Ubuntuの最新版をベースにする
FROM ubuntu:latest

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    wget \
    software-properties-common \
    gcc-11 \
    g++-11

# Python3.10を追加
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.10 python3-pip

# llama-cpp-pythonをインストール
RUN pip install llama-cpp-python

# ワークディレクトリを設定
WORKDIR /usr/src/app

# ファイルをダウンロード
RUN wget https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGML/resolve/main/llama-2-7b-chat.ggmlv3.q8_0.bin

# Pythonファイルをコピー
COPY . .
