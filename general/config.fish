# place in ~/.config/fish

function cs
    cd $argv && ls -alF --group-directories-first
end
