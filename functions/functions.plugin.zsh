# ##############################
# ############ GIT #############
# ##############################

ktask () { kill -9 $(ps -x | grep "$@" | awk '{print $1}') }
gcurrent () git rev-parse --abbrev-ref HEAD

gclean! () git clean -f -d

# Nuclear option -- remove all changes
gnuke! () {
  gco .
  git reset HEAD .
  gclean!
  git reset HEAD .
  gco .
  gclean!
}

gd () git diff "$@"

gds () git diff --staged "$@"

gdh () git diff HEAD\^ "$@"

gr () git rebase "$@"

gri () gr -i "$@"

grc () gr --continue

gback () git reset HEAD\^

gh () git open

gac () {
  ga
  gc "$@"
}

gacm () gac -m "$@"

ga () {
  if [ "$#" -gt 0 ]; then
    git add "$@"
  else
    git add .
  fi
}

gp () {
  # For Unchained
  if [[ ${PWD:A} =~ "unchained" ]]; then
    br=$(git branch --show-current)
    echo "git pull upstream ${br}"
    git pull upstream "${br}"
  else 
    git pull "$@"
  fi
}

gs () git status "$@"

gsp () git stash pop

gss () git stash save

gl () git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "$@"

gco () git checkout "$@"

gcoi () {
  if gb | grep "#$@"; then
    gco "issue#$@"
  else
    gco dev
    gp
    gco -b "issue#$@"
    gpush
  fi
}

gpush () git push "$@"

gb () git branch "$@"

gbd () git branch -d "$@"

gc () {
  if [ "$#" -gt 0 ]; then
    if [ "$#" -gt 1 ]; then
      git commit "$@"
    else
      git commit -m "$@"
    fi
  else
    git commit
  fi
}

gca () git commit --amend

gcaf () git commit --amend --no-edit

grb () git rebase "$@"

g () git "$@"

gcpick () git cherry-pick "$@"

grh () git reset --hard "$@"

gbdelete () git push origin --delete "$@"

glt () {
  git describe --abbrev=0 --tags
}

glc () {
  git rev-parse --short HEAD
}

go () {
  git open
}

gwip () {
 git commit --no-verify -m 'WIP'
}


# ###############################
# ######## CD SHORTCUTS #########
# ###############################

f () cd $HOME/code/"$@"

work () f unchained/"$@"


notes () cd $HOME/Dropbox/Notes/"$@"

wn_dir () n Work/"$@"

wn () v $HOME/Dropbox/Notes/Work

h () cd $HOME/"$@"

desk () h Desktop/"$@"
drop () h Dropbox\ \(Personal\)/

# ##############################
# ######### UNCHAINED ##########
# ##############################

du () {
  source environment.sh && docker-compose down && sleep 1 && docker-compose up trefoil-setup && sleep 1 && docker-compose up trefoil-local
}

dd () {
  source environment.sh && docker-compose down
}

ds () {
  source environment.sh && docker-compose run trefoil-setup python
}

emu-shell () {
  cd ~/code/unchained/trezor-firmware && python3 -m poetry shell
}

emu () {
  cd core && ./emu.py --mnemonic 'merge alley lucky axis penalty manage latin gasp virus captain wheel deal chase fragile chapter boss zero dirt stadium tooth physical valve kid plunge'
}

# ##############################
# ########### OTHER ############
# ##############################

# Prints out tree of all directories below this one
tree () {
  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

tasks () { ps aux | grep "$@" }

co () {
  if [ "$#" -gt 0 ]; then
    code "$@"
  else
    code .
  fi
}

v () {
  co "$@"
}

n () {
  if [ "$#" -gt 0 ]; then
    npm "$@"
  else
    npm install
  fi
}

nr () {
  n run "$@"
}

nnuke () {
  rm -rf node_modules && rm package-lock.json
}

y () {
  if [ "$#" -gt 0 ]; then
    yarn "$@"
  else
    yarn
  fi
}

ys () {
  yarn start
}

zsh_edit () v $ZSH/custom/plugins/functions/functions.plugin.zsh
zsh_dir () $ZSH/custom/plugins/
zshrc () v ~/.zshrc

contains () {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
      return 0    # $substring is in $string
    else
      return 1    # $substring is not in $string
    fi
}


ngrk () {
  ~/ngrok "$@"
}

##
## FFMPEG
##

flacToMP3 () {
  mkdir flac
  for file in ./*.flac; do
    filename="${file%.*}"
    ffmpeg -i "${file}" -ab 320k -map_metadata 0 -id3v2_version 3 "${filename}.mp3";
    mv "${file}" flac
  done
}

##
## ImageMagick
##

grayScale () {
  mkdir grayscale
  for file in ./*"$arg"; do
    filename=${file:1}
    newPath="./grayscale${filename}"
    convert "${file}" -fx '(r+g+b)/3' -colorspace Gray $newPath
  done
}
