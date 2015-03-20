---
layout : post
title  : Vim Tricks
date   : 2014-10-18
---


*   Command to execute a current line as a shell command

```
.w !sh
```

*   Command to execute a visual selection as a shell command.

```
'<,'>w !sh
```

*   Use zg to add a word to ~/.vim/spell/latin.something
*   Use ]s to move to next ad spelled word.
*   Tmux Send 

This command will send "clear" command to pane 0. C-m is enter key at the end of the command.

````
tmux send-keys -t 0 "clear" C-m
````

Here is vim function to send the current line to the pane 1

````
function! TmuxSendKeys()
    let line=getline('.')
    " tried silent but it did not helped to disable the prompt "Press ENTER or
    " type command to continue", so ended up adding extra <cr> in the
    " bindings in the nonoremap for TmuxSendKeys
    exe "!tmux send-keys -t 1 '"line"' C-m"
endfunction

" If you want to send the current line to tmux pane 1 when pressing <cr>, you
"can use these bindings.
function! UndoCmdMode()
    nunmap <cr>
endfunction
function! SetupCmdMode()
    nnoremap <cr> :call TmuxSendKeys()<cr><cr><cr>
endfunction
````
