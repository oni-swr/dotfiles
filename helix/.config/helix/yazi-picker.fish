#!/usr/bin/env fish
# Capture paths from yazi (reads selected paths from stdout)
set paths (yazi --chooser-file=/dev/stdout)

if test -n "$paths"
    # Switch back to the last tmux window
    echo "selected paths:"
    tmux last-window

    # Send keys to tmux: Escape, then the composed command, then Enter
    tmux send-keys Escape

    # In fish, $argv holds all arguments; $argv[1] is the first argument (like $1 in bash).
    # $paths may contain multiple filenames; we pass them as a single string.
    tmux send-keys ":$argv[1] $paths"
    tmux send-keys Enter
else
  #tmux kill-window -t fx
  echo "No paths selected."
end
