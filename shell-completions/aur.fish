function _aur_no_switches
  not __fish_contains_opt -s h help -s v version -s l list -s f force -s g git -s c config -s r remove
end

complete -c aur -f
complete -c aur -n "_aur_no_switches" -a "(basename -a ~/.aur/*/)"
complete -c aur -s h -l help
complete -c aur -s v -l version
complete -c aur -s l -l list
complete -c aur -s f -l force
complete -c aur -s g -l git
complete -c aur -s r -l remove -a "(pacman -Qqm)"
complete -c aur -s c -l config -F -r
