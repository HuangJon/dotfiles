# Starting Tmux
### Connect to a new session with no name
```
tmux -2
```
### Connect to a new named session
```
tmux -2 new -s mysessionname        
```
### Connect to the last opened session
```
tmux -2 a
```
### Connect to an opened session by name
```
tmux -2 a -t mysessionname
```

# Killing Sessions
```
tmux kill-session -t mysessionname
```

# Rename Session
```
ctrl+b $
```
# Detach from Session
```
ctrl+b d
```

# List Sessions
```
tmux ls
```
```
ctrl+b s

use j to go down, k to go up
```

# Windows
### Create a new window
```
ctrl+b c
```
### Rename current window
```
ctrl+b ,
```
### Select Window by number
```
ctrl+b 0...9
```
### Select previously selected window
```
ctrl+b ctrl+b
```
### Select next window
```
ctrl+b n
```
### Select previous window
```
ctrl+b p
```
### Swap windows
```
swap-window -s 2 -t 1
```
### list windows
```
ctrl+b w
```

# Panes
### Split pane vertically
```
ctrl+b v
```
### Split pane horizontally
```
ctrl+b h
```
### Close pane/window
```
ctrl+b x
```
### Toggle pane layout
```
ctrl+b spacebar
```
### Toggle pane zoom
```
ctrl+b z
```
### Move current pane left
```
ctrl+b {
```
### Move current pane right
```
ctrl+b }
```
### Move panes clockwise
```
ctrl+b ctrl+o
```
### Convert pane to window
```
ctrl+b !
```

# Synchronize
### Toggle synchronize panes(send command to all panes)
```
ctrl+b :setw synchronize-panes
```

# Search/Copy (uses vim bindings)
### enter search/copy mode
```
ctrl+b [
```
### search
```
/      # then type the search words
use n to search forwards
N to search backwards
```

### marking position
```
ma              # set mark for current pos on key a
'a              # go to mark a
```

### navigate
```
j               # down
k               # up
ctrl+d          # scroll down one page
ctrl+u          # scroll up one page
gg              # top
G               # bottom
```

### pasting contents of buffer_0
```
ctrl+b ]
```
### show contents of buffer_0
```
ctrl+b :show-buffer
```

### capture pane to buffer
```
ctrl+b :capture-pane
```
### show all buffers and paste selected
```
ctrl+b :choose-buffer
```
### save buffer contents to buf.txt
```
ctrl+b :save-buffer buf.txt
```


