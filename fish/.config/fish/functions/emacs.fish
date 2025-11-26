function emacs -d "Open files in Emacs via emacsclient, fall back to emacs if emacsclient isn't available"
    # If emacsclient is available, use it to connect/create a frame; otherwise call emacs directly.
    if type -q emacsclient
        command emacsclient -c -a"emacs"$argv
    else
        command emacs $argv
    end
end
