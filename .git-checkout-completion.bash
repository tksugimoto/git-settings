

# source ~/.git-checkout-completion.bash を .bashrc

__git_checkout_complete() {
    local branch_list=$(
        git branch \
         --sort=-committerdate \
         --format="%(refname:short)" \
    )

    local current_word=${COMP_WORDS[${COMP_CWORD}]}

    COMPREPLY=( $(compgen -W "${branch_list}" -- "${current_word}") )
}


alias cho='git checkout'

# -o nosort は バグで動かないらしい
# bash - Why does `complete` sort options even with `nosort`? - Unix & Linux Stack Exchange
# https://unix.stackexchange.com/questions/567932/why-does-complete-sort-options-even-with-nosort
complete \
    -o nosort \
    -F __git_checkout_complete \
    cho
