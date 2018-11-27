# shell prompt
# from vim ":PromptlineSnapshot ~/.local/etc/shell_prompt.sh airline"
# if [ -f "$HOME/.local/etc/shell_prompt.sh" ]; then
    # . $HOME/.local/etc/shell_prompt.sh
# fi

if [ -f "$HOME/.local/etc/z.sh" ]; then
   . $HOME/.local/etc/z.sh
fi
# enable bash completion
# yum install bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# git completion
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.local/etc/git-completion.bash
if [ "/bin/zsh" = "$SHELL" ]; then
    echo "git-completion.zsh has bug"
  # if [ -f "$HOME/.local/etc/git-completion.zsh" ]; then
     # zstyle ':completion:*:*:git:*' script $HOME/.local/etc/git-completion.zsh
  # fi
else
  if [ -f "$HOME/.local/etc/git-completion.bash" ]; then
      . $HOME/.local/etc/git-completion.bash
  fi
fi
# for .local lib
export LD_RUN_PATH=$HOME/.local/lib::$LD_RUN_PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

# for tmux
export TERM=xterm-256color
export TERM_ITALICS=true

# for http proxy
export http_proxy="http://127.0.0.1:1080"
export https_proxy="https://127.0.0.1:1080"
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy

# alias
# alias vim=nvim

