# CUDA 11.1 + cuDNN 8 + Ubuntu 18.04 の公式イメージを使用
FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu18.04

# 環境変数を設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    python3.7 python3.7-dev python3-pip \
    git curl wget nano sox \
    && rm -rf /var/lib/apt/lists/*

# Python 3.7 をデフォルトに設定
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1

# pip のアップグレード & Python ライブラリのインストール
RUN pip3 install --upgrade pip && pip3 install --no-cache-dir \
    numpy==1.21.6 \
    cython==0.29.36 \
    scipy \
    torch==1.8.1+cu111 \
    torchvision==0.9.1+cu111 \
    torchaudio==0.8.1 \
    -f https://download.pytorch.org/whl/torch_stable.html && \
    pip3 install --no-cache-dir \
    matplotlib \
    tensorboard \
    jupyterlab \
    h5py \
    scikit-learn \
    soundfile \
    pysptk \
    pyworld \
    librosa \
    dtw_c \
    mlpg_c \
    six \
    nnmnkwii \
    virtualenv


