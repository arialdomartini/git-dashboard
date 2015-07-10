w() {
    clear &&  ls -l && echo && git branch && echo && git status --short --branch
}

dn() {
    git status --short | grep '^.[DM?]' | awk 'NR==1{print ($1=="?" ? "/dev/null" : ""), $2}' | xargs git diff -- && w
}

an() {
    git status --short | grep '^.[DM?]' | awk 'NR==1{print ($1=="D" ? "rm" : "add"), $2}' | xargs git && w
}
