# ##############################
# ############ GIT #############
# ##############################

ktask () { kill -9 $(ps -x | grep "$@" | awk '{print $1}') }
gcurrent () git rev-parse --abbrev-ref HEAD

gclean! () git clean -f -d

gd () git diff "$@"

gds () git diff --staged "$@"

gdh () git diff HEAD\^ "$@"

gr () git rebase "$@"

gri () gr -i "$@"

grc () gr --continue

gback () git reset HEAD\^

gh () hub browse

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

gp () git pull "$@"

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
  if [ "$#" -gt 1 ]; then
    git commit "$@"
  else
    git commit -m "$@"
  fi
}

gca () git commit --amend

grb () git rebase "$@"

g () git "$@"

gcpick () git cherry-pick "$@"

grh () git reset --hard "$@"

gbdelete () git push origin --delete "$@"

# ###############################
# ######## CD SHORTCUTS #########
# ###############################

code () cd $HOME/code/"$@"

red () code redshift/"$@"

f () code "$@"

# ##############################
# ########### OTHER ############
# ##############################

# Prints out tree of all directories below this one
tree () {
  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

tasks () { ps aux | grep "$@" }

sb () {
  if [ "$#" -gt 0 ]; then
    sublime "$@"
  else
    sublime .
  fi
}

zsh_edit () sb $ZSH/custom/plugins/functions/functions.plugin.zsh
zsh_dir () $ZSH/custom/plugins/
zshrc () sb ~/.zshrc

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