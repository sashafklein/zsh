##############################
######### ZEUS BASED #########
##############################

z () zeus start

zr () {
  if zeus_on; then
    zeus "$@"
  else
    "$@"
  fi
}

rmz () rm .zeus.sock

rr () {
  if [ "$#" -gt 0 ]; then
    r routes | grep "$@"
  else
    r routes
  fi
}

zeus_on () {
  if ps aux | grep -v grep | grep 'zeus slave: development_environment'; then
    true
  else
    echo "Zeus is not running"
    false
  fi
}

mg () { r db:migrate "$@" }

tprep () { r db:test:prepare "$@" }

s () {
  if zeus_on; then
    zeus s
  else
    rails s
  fi
}

t () {
  if contains `pwd` ams; then
    if [ "$#" -gt 0 ]; then
      for option in `find test/**/$@Test.js`; do
        echo Running "$option"
        npm run t "$option"
      done
    else
      npm run t
    fi
  else
    if [ "$#" -gt 0 ]; then
      zr rspec "$@"
    else
      zr rspec spec
    fi
  fi
}

tt () zeus rspec --tag $1 spec

r () { zr rake "$@" }

c () {
  if zeus_on; then
    zeus c "$@"
  else
    rails c "$@"
  fi
}

zk () { kill -9 $(ps -x | grep 'zeus' | awk '{print $1}') }

# ##############################
# ############ GIT #############
# ##############################

ktask () { kill -9 $(ps -x | grep "$@" | awk '{print $1}') }
gcurrent () git rev-parse --abbrev-ref HEAD

gclean! () git clean -f -d

gd () git diff "$@"

gds () git diff --staged "$@"

gdh () git diff HEAD\^

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

gcom () git checkout master

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

gprune () {
  foo=gb
  echo foo
}


# ###############################
# ######## CD SHORTCUTS #########
# ###############################

code () cd $HOME/code/"$@"

red () code redshift/"$@"

f () code "$@"

# ##############################
# ########### OTHER ############
# ##############################

tasks () { ps aux | grep "$@" }

b () bundle "$@"

fs () foreman start "$@"

hcon () heroku run rails console
hmain_off () heroku maintenance:off
hmain_on () heroku maintenance:on
hconfig () {
  if [ "$#" -gt 0 ]; then
    heroku config:"$@"
  else
    heroku config
  fi
}

hlogs () {
  if [ "$#" -gt 0 ]; then
    heroku logs "$@"
  else
    heroku logs
  fi
}

dtest () tail -f diagnostic.txt

sb () {
  if [ "$#" -gt 0 ]; then
    sublime "$@"
  else
    sublime .
  fi
}

iospackage() react-native bundle --platform ios --dev false --entry-file index.ios.js --bundle-output iOS/main.jsbundle

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