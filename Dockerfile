FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu18.04

#対話的なインストールを無効化
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# 必要な環境構築用パッケージをインストール
RUN apt-get update && apt-get install -y \
    python3.7 python3.7-dev \
    python3-pip \
    git \
    curl \
    wget \
    nano \
    sox \
    && rm -rf /var/lib/apt/lists/*

# pipを使います.pythonライブラリのインストール
RUN pip3 install --upgrade pip && pip install --no-cache-dir \
    torch==1.8.1+cu111 \
    torchvision==0.9.1+cu111 \
    torchaudio==0.8.1 \
    -f https://download.pytorch.org/whl/torch_stable.html && \
    pip install --no-cache-dir \
    numpy \
    matplotlib \
    tensorboard \
    jupyterlab \
    h5py \
    scipy \
    scikit-learn \
    soundfile \
    pysptk \
    pyworld \
    librosa \
    dtw_c \
    mlpg_c \
    six \
    nnmnkwii

EXPOSE 8888 6006
ENTRYPOINT ["/bin/bash"]

