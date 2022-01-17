# tmux新开pane时，保留原来的conda环境, 以及pwd

tmux split-window -v -p 50  -c '#{pane_current_path}'
                   # -p percent,
my_conda=$(echo $CONDA_DEFAULT_ENV)  # 没必要export
tmux send-keys  "conda activate ${my_conda}" Enter
                                            # Enter加不加引号都行
tmux send-keys  "clear && figlet Welcome" 'Enter'


# 在tmux看来, $CONDA_DEFAULT_ENV"是 进入tmux时所在的环境
# 在zsh里敲, $CONDA_DEFAULT_ENV 则是当前所在conda环境
# 失败:
    # 1.
    # tmux send-keys  "conda activate ${CONDA_DEFAULT_ENV}" Enter
    # 2.
    # tmux run-shell 'export my_conda=${CONDA_DEFAULT_ENV}'
    # tmux send-keys  "conda activate ${my_conda}" Enter
