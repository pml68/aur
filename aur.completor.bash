output=aur-completion.bash
cmd=aur
cmd_args=@aur_pkgs
cmd_opts=(
  -h --help
  -l --list
  -f --force
  -g --git
  -c:@files
  --config:@files
)

reply_aur_pkgs() {
  pkgs=`basename -a ~/.aur/*/ | paste -d ' ' -s -`

  COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
}
