##############################
######### ZEUS BASED #########
##############################

z () zeus start

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
    false
  fi
}

mg () r db:migrate "$@"

tprep () {
  if zeus_on; then
    zeus rake db:test:prepare "$@"
  else
    echo "Zeus is not running"
    rake db:test:prepare "$@"
  fi
}

s () { 
  if zeus_on; then
    zeus s
  else
    echo "Zeus is not running"
    rails s
  fi
}

t () {
  if zeus_on; then
    if [ '$#' -gt 0 ]; then
      zeus test "$@"
    else
      zeus test spec
    fi
  else
    echo "Zeus is not running"
    if [ "$#" -gt 0 ]; then
      rspec "$@"
    else
      rspec spec
    fi
  fi
}

tt () zeus rspec --tag $1 spec

r () {
  if zeus_on; then
    zeus rake "$@"
  else
    echo "Zeus is not running"
    rake "$@"
  fi
}

c () {
  if zeus_on; then
    zeus c "$@"
  else
    echo "Zeus is not running"
    rails c "$@"
  fi
}

jt () {
  if zeus_on; then
    if [ "$#" -gt 0 ]; then
      zeus tr spec:javascript SPEC="$@"
    else
      zeus tr spec:javascript
    fi
  else
    echo "Zeus is not running"
    if [ "$#" -gt 0 ]; then
      rake spec:javascript RAILS_ENV=test SPEC="$@"
    else
      rake spec:javascript RAILS_ENV=test
    fi
  fi
}

# ##############################
# ############ GIT #############
# ##############################

gcurrent () git rev-parse --abbrev-ref HEAD

gclean! () git clean -f -d

gd () git diff "$@"

gds () git diff --staged "$@"

gdh () git diff HEAD^

gr () git rebase "$@"

gri () gr -i "$@"

grc () gr --continue

gback () git reset HEAD^

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

gcom () git checkout master

gpush () git push "$@"

gb () git branch "$@"

gbd () git branch -d "$@"

gc () git commit "$@"

gca () gc --amend

grb () git rebase "$@"

g () git "$@"

gcpick () git cherry-pick "$@"

grh () git reset --hard "$@"

gbdelete () git push origin --delete "$@"


# ###############################
# ######## CD SHORTCUTS #########
# ###############################

fish_dir () cd ~/.config/fish/

code () cd $HOME/code/"$@"

f () code "$@"

plan () f planit/"$@"

bloc () f 'bloc/bloc'

# ##############################
# ########### OTHER ############
# ##############################


tasks () { ps aux | grep "$@" }

b () bundle "$@"

fs () foreman start "$@"

hcon () heroku run rails console

dtest () tail -f diagnostic.txt

sb () {
  if [ "$#" -gt 0 ]; then
    sublime "$@"
  else
    sublime .
  fi
}

fish_edit () sb ~/.config/fish/config.fish

zsh_edit () sb $ZSH/custom/plugins/functions/functions.plugin.zsh
zsh_dir () $ZSH/custom/plugins/