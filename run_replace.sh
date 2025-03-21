#!/usr/bin/env bash
pwd
#git remote add origin https://github.com/hcji/DeepMASS2_GUI
#git pull origin lkr_dev:lkr_dev
#git reset --hard origin/lkr_dev
source activate deepmass2
lsof -i:12341 | grep 'TCP' | awk '{print $2}' | xargs kill -9
lsof -i:8000 | grep 'TCP' | awk '{print $2}' | xargs kill -9
SCRIPT_DIR=$(dirname "$(realpath "$0")")
export PYTHONPATH="$SCRIPT_DIR/backend:$PYTHONPATH"
python ./backend/gradio_app.py & python ./backend/register.py
