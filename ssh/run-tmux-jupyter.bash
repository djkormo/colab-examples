#!/bin/bash
tmux new-session -d 'jupyter notebook --ip 0.0.0.0 --NotebookApp.token='' --no-browser'
tmux split-window -v 'ssh -R myjupyter-lab:80:localhost:8888 serveo.net'
tmux split-window -h
tmux new-window 'nvtop'
tmux -2 attach-session -d