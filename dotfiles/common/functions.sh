#!/usr/bin/env bash

###############
## Utilities ##
###############

untar() {
  tar -zxvf $@
}

# Combine cd and ls
cl() {
  cd $@
  if [[ $@ ]]; then
    ls
  fi  
}

mk() {
  mkdir -p "$@" && cd "$@"
}

copysssh() {
  pbcopy < "$HOME/.ssh/id_rsa.pub"
}

convertwebm () {
 ffmpeg -i $1 -vcodec  libvpx-vp9 -b:v 1M -acodec libvorbis $2
}


mp3() {
  youtube-dl -x --audio-format mp3 --audio-quality $@
}

sizes() {
  du -xhd1 | sort -n
}

# Get weather.  Needs work, specify actual location instead of relying on IP addr
weather() {
	curl http://wttr.in/\?m
}

#######################
## Network Utilities ##
#######################

myip() {
  ifconfig | grep 'inet ' | grep -v 127.0.0.1
}

# Print external IP
externalip() {
  curl 'https://api.ipify.org'  && echo
}

port() {
  sudo netstat -ltnp | grep -w ':$1'
}

portcheck() {
	re='^[0-9]+$'
	reserved=1024
	for port in "$@"
		do
			if ! [[ $port =~ $re ]]; then
				echo "Error: not a number: $port"
			elif [[ $port -le $reserved  ]]; then
				# echo "port less than 1024"
				sudo lsof -nP -i4TCP:$port | grep LISTEN
			else
				# echo "port greater than 1024"
				lsof -nP -i4TCP:$port | grep LISTEN
			fi
		done
}


###############
## Dev Tools ##
###############

gitinit() {
  git init
  touch .gitignore
  git add .gitignore *
}

dvolume() {
  local volume volumes_to_list=${1:-$(docker volume ls --quiet)}
  for volume in $volumes_to_list; do
    sudo ls -lRa "$(docker volume inspect --format '{{ .Mountpoint }}' "$volume")"
    echo
  done
}

# Print lines of code for files in current git directory
loc() {
  git ls-files | xargs wc -l
}

# Reload the shell (i.e. invoke as a login shell)
reload() {
  exec ${SHELL} -l
}

# Print each PATH entry on a separate line
path() {
  echo -e ${PATH//:/\\n}
}

# Start ngrok
ngrok() {
  ~/bin/ngrok $@
}
