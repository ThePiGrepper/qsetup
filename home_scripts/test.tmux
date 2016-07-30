#tmux script

new -s Main

#Main session - window config
rename-window edit
new-window
rename-window surf
new-window
rename-window inquire

select-window -t :0
selectp -t 0 # select the first (0) pane
splitw -h -p 40 # split it into two halves
selectp -t 1 # select the new, second (1) pane
splitw -v -p 50 # split it into two halves
selectp -t 0 # go back to the first pane
