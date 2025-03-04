# 深層学習用 Dockerfile
## 内容物：
- Dockerfile
## 概要：
- 深層学習, 音声処理に必要なライブラリを大体入れたDocker imageです.
- python3.7.1
- nvidia/cuda:11.1.1-cudnn8-devel-ubuntu18.04
- torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1
## 使い方：
研究室のPCにリモート接続できていることを前提にします.
- このリポジトリをクローン
```
git clone https://github.com/Lemontea014/docker_SASP
```
- ディレクトリをdocker_SASPに移動
```
cd docker_SASP
```
- Dockerimageを作成（名前を適当にmy-gpu-imageとします）
```
docker build -t my-gpu-image .
```
- 作成したイメージを使って, コンテナを作成＆起動（コンテナ名を適当にmy-gpu-containerとします）
```
docker run -it --gpus all -p 8888:8888 -p 6006:6006 --name my-gpu-container my-gpu-image
```
- jupyterlabを起動（遠隔操作側のPCで開けるように、--no-browserをつけておく）
```
jupyter-lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser
```
- 表示されるアドレスを開けば, webブラウザ上で仮想環境に入れるはずです. これで一旦の環境構築は終わりです.
- !!注意!! アドレスはおそらくhttp://localhost:8888/のように表示されますが, localhostの部分をホスト側（コンテナがある）PCのIPアドレスに置き換えてください.
