# ##############################
# ############ GIT #############
# ##############################

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

# gh () git open

gac () {
  ga
  gc "$@"
}

gbMerged () {
  git branch --merged | egrep -v "(^\*|$@)"
}

gbDeleteMerged () {
  git branch --merged | egrep -v "(^\*|$@)" | xargs git branch -d
}

gbcleanup () {
  force_delete=false
  excluded_branches=()

  # Parse flags and arguments
  while [[ "$1" != "" ]]; do
    case $1 in
      -e | --exclude )
        shift
        while [[ "$1" != "" && "$1" != -* ]]; do
          excluded_branches+=("$1")
          shift
        done
        ;;
      -f | --force )
        force_delete=true
        shift
        ;;
      * )
        echo "Unknown option: $1"
        return 1
        ;;
    esac
  done

  # Echo the results of git branch into a temp-branches.txt file
  git branch > temp-branches.txt

  # Remove the current branch (denoted by *) from the list
  sed -i '' '/\*/d' temp-branches.txt

  # Remove the master and main branches from the list
  sed -i '' '/master/d' temp-branches.txt
  sed -i '' '/main/d' temp-branches.txt

  # Read the branches into an array
  branches=()
  while IFS= read -r line; do
    branches+=("$line")
  done < temp-branches.txt

  # Remove the excluded branches from the list
  for excluded_branch in "${excluded_branches[@]}"; do
    echo "Excluding branch $excluded_branch"
    branches=("${branches[@]/$excluded_branch/}")
  done

  # If lines were excluded, echo an empty line
  if [ ${#excluded_branches[@]} -gt 0 ]; then
    echo ""
  fi
  
  # Remove the temp-branches.txt file
  rm temp-branches.txt

  # Determine the git branch delete command
  delete_flag="-d"
  if [ "$force_delete" = true ]; then
    delete_flag="-D"
  fi

  # Remove all branches that have been merged into the current branch
  for branch in "${branches[@]}"; do
    # Trim leading and trailing whitespace from the branch name
    branch=$(echo $branch | xargs)
    if [[ -n "$branch" ]]; then
      # Execute the git delete command
      git branch $delete_flag "$branch"
    fi
  done
}

# git branch --set-upstream-to={remote || "origin"}/{branch} {branch}
gbsu () {
  # Assign branch name to variable
  branch=$(git branch --show-current)
  # If there are no arguments, set the upstream to origin
  if [ "$#" -eq 0 ]; then
    git branch "--set-upstream-to=origin/$branch" "$@"
  else
    git branch "--set-upstream-to=$1/$branch" "$@"
  fi
}

gmk () {
  if [ "$#" -eq 0 ]; then
    echo "Please provide a commit name"
  else
    ga
    gss
    gp
    gsp
    ga
    gc -m "$@"
  fi
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
  git pull "$@"
}

gs () git status "$@"

gsp () git stash pop

gss () git stash save

grs () git restore --staged "$@"

gl () {
  git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "$@"
}

gswitch () {
  git switch -c "$@"
}

gtrack () {
  gco "$@" && gswitch "$@"
}

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

gca () {
  if [ "$#" -gt 0 ]; then
    git commit --amend "$@"
  else
    git commit --amend
  fi
}

gcaf () git commit --amend --no-edit

grb () git rebase "$@"

g () git "$@"

gcp () git cherry-pick "$@"

grh () git reset --hard "$@"

gbdelete () git push origin --delete "$@"

glt () {
  git describe --abbrev=0 --tags
}

glc () {
  git rev-parse --short HEAD
}

go () {
  # If .git/config contains git@gitlab
  if grep -q "git@gitlab" .git/config; then
    # Save root path to variable
    root="https://gitlab.ssvc.uncd.io"
    # Save organization and project to variables
    org=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $2}')
    project=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $3}')

    # Get MR number associated with branch
    mr=$(git branch -vv | grep $(gcurrent) | awk '{print $3}')
    echo "Opening $root/$org/$project/-/merge_requests/$mr"
    branchPath="-/tree/$(gcurrent)"

  # If .git/config does not contain git@gitlab
  else
    # Save root path to variable
    root="https://github.com"

    # Save organization and project to variables
    org=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $2}')
    project=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $3}')

    # Path to branch on github
    branchPath="tree/$(gcurrent)"
  fi

  # If branch is main or master, open the project
  if [ "$(gcurrent)" = "main" ] || [ "$(gcurrent)" = "master" ]; then
    echo "Opening $root/$org/$project"
    open "$root/$org/$project"

  # If branch is not main, open the branch
  else
    echo "Opening $root/$org/$project/$branchPath"
    open "$root/$org/$project/$branchPath"
  fi
}

gwip () {
 git commit --no-verify -m 'WIP'
}


# ###############################
# ######## CD SHORTCUTS #########
# ###############################

f () cd $HOME/code/"$@"

work () f unchained/"$@"
ts () f ts/"$@"


notes () cd $HOME/Dropbox/Notes/"$@"

wn_dir () n Work/"$@"

wn () v $HOME/Dropbox/Notes/Work

h () cd $HOME/"$@"

desk () h Desktop/"$@"
drop () h Dropbox\ \(Personal\)/

dc () docker compose "$@"

# ##############################
# ######### UNCHAINED ##########
# ##############################


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

ktask () { 
  kill -9 $(ps -x | grep "$@" | awk '{print $1}')
}

kport() {
  local port=$1
  local pids=$(lsof -ti :$port)
  if [ -z "$pids" ]; then
    echo "No process found running on port $port."
  else
    echo "Killing processes on port $port: $pids"
    kill -9 $pids
  fi
}

tasks () { ps aux | grep "$@" }

v () {
  if [ "$#" -gt 0 ]; then
    code "$@"
  else
    code .
  fi
}

n () {
  # If there's a bun.lockb in the directory AND there is no package-lock.json, use bun
  if [ -f "bun.lock" ] && [ ! -f "package-lock.json" ]; then
    if [ "$#" -gt 0 ]; then
      bun "$@"
    else
      bun install
    fi
  else
    if [ "$#" -gt 0 ]; then
      npm "$@"
    else
      npm install
    fi
  fi
}

ns () {
  n start
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

kport () {
  if [ "$#" -gt 0 ]; then
    npx kill-port "$@"
  else
    echo "Please specify a port"
  fi
}

zsh_edit () v $ZSH/custom/plugins/functions/functions.plugin.zsh
zsh_dir () $ZSH/custom/plugins/
zsh_refresh () source ~/.zshrc
zsh_reload () source ~/.zshrc
zsh_push ()  {
  PWD_VAR=$(pwd)
  zsh_dir
  ga

  if [ "$#" -gt 0 ]; then
    gc -m "$@"
  else
    gc -m "Updated ZSH functions"
  fi

  gpush
  $PWD_VAR
}

bbr () {
  bun --bun run "$@"
}

zsh_list () echo "
  zsh_edit - edit the
  zsh_dir - move to the dir
  zsh_refresh - reload
  zsh_push - add, commit, and push
  zshrc - open the file
"

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
