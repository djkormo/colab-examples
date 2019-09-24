#!/bin/bash
export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so
tmux new-session -d 'jupyter notebook --ip 0.0.0.0 --NotebookApp.token='' --no-browser'
tmux split-window -v 'ssh -R myjupyter-lab:80:localhost:8888 serveo.net StrictHostKeyChecking=accept-new'
tmux split-window -h 'nvtop'
#tmux new-window 'nvtop'
tmux -2 attach-session -d