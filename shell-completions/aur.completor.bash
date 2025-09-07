# shellcheck disable=SC2034
output=aur-completion.bash
cmd=aur
cmd_args=@aur_pkgs
cmd_opts=(
  -h --help
  -v --version
  -l --list
  -f --force
  -g --git
  -c:@files
  --config:@files
  -r:@pacman
  --remove:@pacman
)

reply_aur_pkgs() {
  pkgs=$(basename -a ~/.aur/*/ | paste -d ' ' -s -)

  COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
}

reply_pacman() {
  pkgs=$(pacman -Qqm | paste -d ' ' -s -)

  COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
}
