# tmux
Note for tmux usage

## Introduction
tmux is a "terminal multiplexer", it enables a number of terminals (or windows) to be accessed and controlled from a single terminal. To run tmux on server, even you close the terminal console software on your pc, tmux will keep all sessions you created. Once you login this server again, you just need to attach tmux, and all sessions you created will restore to the latest status you have. So, tmux is the best partner for programmers.

```
tmux
  |
  | session_0
  |------------------|  window_0
  |                  |------------------|  pane_0
  | session_1        |                  |-----------
  |----------        |  window_1        |
  |                  |-----------       |  pane_1
  |    ...           |                  |----------
  |                  |   ...            |
  | session_N        |                  |   ...
  |----------        |  window_M        |
                     |-----------       |  pane_P
                     |                  |----------
```
tmux can handle multiple sessions at the same time. When you are trying to use one of session, you have to attach one of sessions. In this session, you can create multiple windows. In current window, you can create multiple pane for display usage. Below picture is a example for usage.
![tmux_intro](https://tmux_intro.png)
In this example, session name is rpi. There are three windows in this sessions. Window_0 is build. Window_1 is code. Window_2 is test. Current window is window_1, the green one. In window_1, there are three panes.

## Config file
tmux/.tmux.conf is the config file I am using. Place `.tmux.conf` under $HOME directory.

## Basic usage:
* `tmux` : create a new session and use the default session name.
* `tmux new –s SESSION_NAME` : create a new session and session name is SESSION_NAME.
* `tmux ls` : list all sessions out.
* `tmux attach –t SESSION_NAME` : attach SESSION_NAME.
( you can use some alias in your .bashrc for general usage)

## Key bindings: 

### help & general
* `<Ctrl-a> ?` : list all key bindings.
* `<Ctrl-a> esc` : enter the browsing mode for history memory.

### Session 
* `<Ctrl-a> d` : detach current session.
* `<Ctrl-a> $` : rename session.
* `<Ctrl-a> )` : switch to next session.
* `<Ctrl-a> (` : switch to previous session.

### Window
* `<Ctrl-a> c` : creat a window.
* `<Ctrl-a> A` : rename this window.
* `<Ctrl-a> 0~9` : switch to 0~9 window.
* `<Ctrl-a-a>` : switch to the previous window.
* `<Ctrl-a-w>` : list all window and switch to the window you select.
* `<Ctrl-a> &` : delete the current window.
* `<Ctrl-a> z` : zoom in/out the current window.
* `<Ctrl-a> :` => `swap-window -s NUM1` : swap current window to NUM1 window
* `<Ctrl-a> :` => `swap-window -t -1` : move current window to the left by one position
* `<Ctrl-a> :` => `swap-window -t +1` : move current window to the right by one position
* `<Ctrl-a> :` => `swap-window -s NUM1 -t NUM2` : swap source window NUM1 to destination window NUM2
* `<Ctrl-a> :` => `move-pane -t SESSION:WINDOW ` : move the current window to WINDOW of SESSION

### Pane
* `<Ctrl-a> |` : split a window into two vertical pane.
* `<Ctrl-a> s` : split a window into two horizontal pane.
* `<Ctrl-a> j` : goto upper pane.
* `<Ctrl-a> k` : goto lower pane.
* `<Ctrl-a> h` : goto left pane.
* `<Ctrl-a> l` : goto right pane.
* `<Ctrl-a> -` : reduce the height of pane.
* `<Ctrl-a> +` : increase the height of pane. 

### copy, paste
* `<Ctrl-a> ESC` : enter copy-mode-vi mode
* `Space`        : begin selection
* `Enter`        : Copy
* `ESC`          : exit copy-mode-vi mode
* `<Ctrl-a> ]`   : paste
