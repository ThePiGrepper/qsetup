#tmux session setup: MCU
#execute from a new session(only with default window)

#new -s MCU
#Main session - window config
rename-session MCU
rename-window edit
new-window
rename-window debug
split-window -h
new-window
rename-window surf
new-window
rename-window ext
move-window -t 9
select-window -t :=0
send-keys 'cd ~/work/MCU/vault' Enter
