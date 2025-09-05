#!/bin/bash

set -e 

BASE_DIR="/home/vboxuser/ds_starter"
APP_DIR="$BASE_DIR/app"
PAGES_DIR="$APP_DIR/pages"
DB_FILE="$BASE_DIR/ds_starter.db"
REQ_FILE="$BASE_DIR/requirements.txt"

sudo apt-get update -y
sudo apt-get install -y python3 python3.venv python3-p

mkdir -p "$PAGES_DIR"
chmod -R 777 "$BASE_DIR"

cd "$APP_DIR"
python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip
pip install streamlit matplotlib pandas numpy
pip freeze > requirements.txt


cd /home/vboxuser/ds_starter
sqlite3 ds_starter.db "VACUUM;"