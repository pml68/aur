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
  pkgs=( $(find ~/.aur/ -type d -mindepth 1 -maxdepth 1) );
  for i in "${!pkgs[@]}";
  do
    pkgs[$i]=$(basename "${pkgs[$i]}");
  done;

  COMPREPLY=( $(compgen -W "${pkgs[*]}" -- "$cur") )
}
