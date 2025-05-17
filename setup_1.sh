#!/bin/bash

set -e

echo "Cập nhật hệ thống..."
sudo apt update && sudo apt upgrade -y

echo "Tải và cài pip cho Python 3.12..."
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.12 get-pip.py

echo "Kiểm tra pip phiên bản..."
python3.12 -m pip --version

echo "Nâng cấp pip, setuptools và wheel..."
python3.12 -m pip install --upgrade pip setuptools wheel

echo "Cài đặt các công cụ build và thư viện hỗ trợ..."
sudo apt install -y build-essential pkg-config libffi-dev libsndfile1 ffmpeg

echo "Cài các thư viện trong file linux_requirements.txt..."
python3.12 -m pip install -r linux_requirements.txt

echo "Hoàn thành!"
