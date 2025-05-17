#!/bin/bash

set -e

echo "Cập nhật hệ thống..."
sudo apt update && sudo apt upgrade -y

echo "Thêm PPA deadsnakes để cài Python 3.10..."
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

echo "Cài Python 3.10 và các gói liên quan..."
sudo apt install -y python3.10 python3.10-venv python3.10-distutils python3.10-dev

echo "Kiểm tra Python 3.10 phiên bản..."
python3.10 --version

echo "Cài distutils (nếu cần)..."
sudo apt install -y python3.10-distutils

echo "Tải và cài pip cho Python 3.10..."
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.10 get-pip.py

echo "Kiểm tra pip phiên bản..."
python3.10 -m pip --version

echo "Nâng cấp pip, setuptools và wheel..."
python3.10 -m pip install --upgrade pip setuptools wheel

echo "Cài đặt các công cụ build và thư viện hỗ trợ..."
sudo apt install -y build-essential pkg-config libffi-dev libsndfile1 ffmpeg

echo "Cài các thư viện trong file linux_requirements.txt..."
pip install -r linux_requirements.txt

echo "Hoàn thành!"
