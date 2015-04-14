---
title: Scripting with tmux
---

Tmux can be scripted easily. Here is a sample script:

```
tmux has-session -t basics
if [ $? != 0 ]
then
  # create new window and start jekyll
  tmux new-session -s basics -n editor -d
  tmux send-keys -t basics 'cd ~/git/jayrajput.github.io/' C-m
  tmux send-keys -t basics 'rvm use 1.9' C-m
  tmux send-keys -t basics 'jekyll build --watch' C-m

  # horizontal split
  tmux split-window -v -t basics
  tmux select-layout -t basics main-horizontal

  # start python http server in the second pane
  tmux send-keys -t basics:0.1 'cd ~/git/jayrajput.github.io/_site/' C-m
  tmux send-keys -t basics:0.1 'sudo service jenkins stop' C-m
  tmux send-keys -t basics:0.1 'python -m SimpleHTTPServer 8080' C-m

  tmux new-window -n console -t basics
  tmux select-window -t basics:2
fi
tmux attach -t basics
```


There is a also a project called tmuxinator available which lets you configure
projects based on the yaml files. See [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
