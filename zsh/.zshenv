# Avoid the PTY echoing keystrokes typed before zsh's line editor starts.
if [[ -o interactive && -t 0 ]]; then
    stty -echo
fi
