# ##############################
# ############ GIT #############
# ##############################

# Add this function near the top of the file, after the Git header
_get_function_info() {
  local func_name=$1
  local type=$2  # "desc" for description, "category" for category

  case "$func_name" in
    # Git commands
    "gcurrent") [[ $type == "desc" ]] && echo "Get the current git branch name";;
    "gclean!") [[ $type == "desc" ]] && echo "Remove untracked files and directories";;
    "gnuke!") [[ $type == "desc" ]] && echo "Nuclear option - remove all changes and untracked files" ;;
    "gd") [[ $type == "desc" ]] && echo "Show git diff" || echo "Git" ;;
    "gds") [[ $type == "desc" ]] && echo "Show git diff for staged changes" || echo "Git" ;;
    "gdh") [[ $type == "desc" ]] && echo "Show git diff against HEAD^" || echo "Git" ;;
    "gr") [[ $type == "desc" ]] && echo "Git rebase" || echo "Git" ;;
    "gri") [[ $type == "desc" ]] && echo "Git interactive rebase" || echo "Git" ;;
    "grc") [[ $type == "desc" ]] && echo "Continue git rebase" || echo "Git" ;;
    "gback") [[ $type == "desc" ]] && echo "Reset to previous commit" || echo "Git" ;;
    "gac") [[ $type == "desc" ]] && echo "Git add all and commit" || echo "Git" ;;
    "gbMerged") [[ $type == "desc" ]] && echo "Show merged branches" || echo "Git" ;;
    "grhu") [[ $type == "desc" ]] && echo "Reset hard to origin of current branch" || echo "Git" ;;
    "gmm") [[ $type == "desc" ]] && echo "Merge latest main into current branch" || echo "Git" ;;
    "gbcleanup") [[ $type == "desc" ]] && echo "Clean up all branches except current and master branches" || echo "Git" ;;
    "gbsu") [[ $type == "desc" ]] && echo "Set upstream branch for current branch" || echo "Git" ;;
    "gmk") [[ $type == "desc" ]] && echo "Commit local changes on top of remote ones" || echo "Git" ;;
    "gacm") [[ $type == "desc" ]] && echo "Git add all and commit with message" || echo "Git" ;;
    "ga") [[ $type == "desc" ]] && echo "Git add files" || echo "Git" ;;
    "gp") [[ $type == "desc" ]] && echo "Git pull" || echo "Git" ;;
    "gs") [[ $type == "desc" ]] && echo "Git status" || echo "Git" ;;
    "gsp") [[ $type == "desc" ]] && echo "Git stash pop" || echo "Git" ;;
    "gss") [[ $type == "desc" ]] && echo "Git stash save" || echo "Git" ;;
    "grs") [[ $type == "desc" ]] && echo "Git restore staged files" || echo "Git" ;;
    "gl") [[ $type == "desc" ]] && echo "Git log with pretty format" || echo "Git" ;;
    "gswitch") [[ $type == "desc" ]] && echo "Create and switch to new branch" || echo "Git" ;;
    "gtrack") [[ $type == "desc" ]] && echo "Checkout and create new branch" || echo "Git" ;;
    "gco") [[ $type == "desc" ]] && echo "Git checkout" || echo "Git" ;;
    "gcoi") [[ $type == "desc" ]] && echo "Checkout issue branch" || echo "Git" ;;
    "gpush") [[ $type == "desc" ]] && echo "Git push" || echo "Git" ;;
    "gb") [[ $type == "desc" ]] && echo "Git branch" || echo "Git" ;;
    "gbd") [[ $type == "desc" ]] && echo "Git branch delete" || echo "Git" ;;
    "gc") [[ $type == "desc" ]] && echo "Git commit" || echo "Git" ;;
    "gca") [[ $type == "desc" ]] && echo "Git commit amend" || echo "Git" ;;
    "gcaf") [[ $type == "desc" ]] && echo "Git commit amend without editing message" || echo "Git" ;;
    "grb") [[ $type == "desc" ]] && echo "Git rebase" || echo "Git" ;;
    "g") [[ $type == "desc" ]] && echo "Git command wrapper" || echo "Git" ;;
    "gcp") [[ $type == "desc" ]] && echo "Git cherry-pick" || echo "Git" ;;
    "grh") [[ $type == "desc" ]] && echo "Git reset hard" || echo "Git" ;;
    "gbdelete") [[ $type == "desc" ]] && echo "Delete branch from origin" || echo "Git" ;;
    "glt") [[ $type == "desc" ]] && echo "Get latest tag" || echo "Git" ;;
    "glc") [[ $type == "desc" ]] && echo "Get latest commit hash" || echo "Git" ;;
    "go") [[ $type == "desc" ]] && echo "Open repository in browser" || echo "Git" ;;
    "gwip") [[ $type == "desc" ]] && echo "Create WIP commit" || echo "Git" ;;

    # Directory commands
    "f") [[ $type == "desc" ]] && echo "Change to code directory" || echo "Directory" ;;
    "work") [[ $type == "desc" ]] && echo "Change to unchained directory" || echo "Directory" ;;
    "mine") [[ $type == "desc" ]] && echo "Change to personal code directory" || echo "Directory" ;;
    "ts") [[ $type == "desc" ]] && echo "Change to TypeScript directory" || echo "Directory" ;;
    "notes") [[ $type == "desc" ]] && echo "Change to notes directory" || echo "Directory" ;;
    "wn_dir") [[ $type == "desc" ]] && echo "Change to work notes directory" || echo "Directory" ;;
    "wn") [[ $type == "desc" ]] && echo "Open work notes in editor" || echo "Directory" ;;
    "h") [[ $type == "desc" ]] && echo "Change to home directory" || echo "Directory" ;;
    "desk") [[ $type == "desc" ]] && echo "Change to desktop directory" || echo "Directory" ;;
    "drop") [[ $type == "desc" ]] && echo "Change to Dropbox directory" || echo "Directory" ;;

    # Docker commands
    "dlogin") [[ $type == "desc" ]] && echo "Login to docker registries" || echo "Docker" ;;
    "ds") [[ $type == "desc" ]] && echo "Run trefoil-setup python container" || echo "Docker" ;;
    "emu-shell") [[ $type == "desc" ]] && echo "Open emulator shell" || echo "Docker" ;;
    "emu") [[ $type == "desc" ]] && echo "Run emulator" || echo "Docker" ;;

    # Utility commands
    "tree") [[ $type == "desc" ]] && echo "Print directory tree structure" || echo "Utility" ;;
    "ktask") [[ $type == "desc" ]] && echo "Kill task by name" || echo "Utility" ;;
    "kport") [[ $type == "desc" ]] && echo "Kill process on port" || echo "Utility" ;;
    "tasks") [[ $type == "desc" ]] && echo "List tasks matching pattern" || echo "Utility" ;;
    "tg") [[ $type == "desc" ]] && echo "Run terminal GPT" || echo "Utility" ;;
    "v") [[ $type == "desc" ]] && echo "Open in Cursor editor" || echo "Utility" ;;
    "n") [[ $type == "desc" ]] && echo "Run npm or bun command" || echo "Utility" ;;
    "ns") [[ $type == "desc" ]] && echo "Run npm/bun start" || echo "Utility" ;;
    "nr") [[ $type == "desc" ]] && echo "Run npm/bun script" || echo "Utility" ;;
    "nnuke") [[ $type == "desc" ]] && echo "Remove node_modules and lock file" || echo "Utility" ;;
    "y") [[ $type == "desc" ]] && echo "Run yarn command" || echo "Utility" ;;
    "ys") [[ $type == "desc" ]] && echo "Run yarn start" || echo "Utility" ;;
    "bbr") [[ $type == "desc" ]] && echo "Run with bun runtime" || echo "Utility" ;;

    # ZSH management
    "zsh_edit") [[ $type == "desc" ]] && echo "Edit ZSH functions file" || echo "ZSH" ;;
    "zsh_dir") [[ $type == "desc" ]] && echo "Go to ZSH plugins directory" || echo "ZSH" ;;
    "zsh_refresh") [[ $type == "desc" ]] && echo "Reload ZSH configuration" || echo "ZSH" ;;
    "zsh_reload") [[ $type == "desc" ]] && echo "Reload ZSH configuration" || echo "ZSH" ;;
    "zsh_push") [[ $type == "desc" ]] && echo "Commit and push ZSH changes" || echo "ZSH" ;;
    "zsh_list") [[ $type == "desc" ]] && echo "List ZSH functions" || echo "ZSH" ;;
    "zshrc") [[ $type == "desc" ]] && echo "Edit ZSH configuration" || echo "ZSH" ;;
    "zsh_functions") [[ $type == "desc" ]] && echo "Show all available functions with descriptions" || echo "ZSH" ;;

    # Other utilities
    "contains") [[ $type == "desc" ]] && echo "Check if string contains substring" || echo "Other" ;;
    "ngrk") [[ $type == "desc" ]] && echo "Run ngrok" || echo "Other" ;;
    "flacToMP3") [[ $type == "desc" ]] && echo "Convert FLAC files to MP3" || echo "Other" ;;
    "grayScale") [[ $type == "desc" ]] && echo "Convert images to grayscale" || echo "Other" ;;
    "getHelp") [[ $type == "desc" ]] && echo "Get help for a specific function" || echo "Other" ;;
    "renameBulk")
      echo "Arguments:"
      echo "  [--force|-f]: Actually perform the renaming (optional)"
      echo "  pattern: Perl-style regex pattern with capture groups"
      echo "  replacement: Replacement pattern using \$1, \$2, etc. for captured groups"
      echo ""
      echo "Example:"
      echo "  renameBulk 'currentUsers(\d+\.\d+)\.svg' 'slide\$1.svg'"
      echo "  This would rename 'currentUsers00.1.svg' to 'slide00.1.svg'"
      echo ""
      echo "Note: Do not include slashes in the pattern - they are added automatically"
      echo "By default, this command only shows what would be renamed."
      echo "Add --force to actually perform the renaming."
      ;;
  esac
}

# Modify show_help to use _get_function_info
show_help() {
  local func_name=$1
  local desc=$(_get_function_info "$func_name" "desc")

  # Show description if available
  if [[ -n "$desc" ]]; then
    echo "$desc"
  fi

  echo "Usage: $func_name [options]"

  # Add any additional usage information for specific commands
  case "$func_name" in
    "gbcleanup")
      echo "Options:"
      echo "  -e, --exclude [branch1] [branch2]: Exclude branches from deletion"
      echo "  -f, --force: Force delete branches"
      ;;
    "gbdelete")
      echo "Arguments:"
      echo "  branchName: Name of the branch to delete from origin"
      ;;
    "contains")
      echo "Arguments:"
      echo "  string: The string to search in"
      echo "  substring: The substring to search for"
      ;;
    "kport")
      echo "Arguments:"
      echo "  port: The port number to kill processes on"
      ;;
  esac
}

# Modify zsh_functions to use _get_function_info
zsh_functions() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_functions"
    return 0
  fi

  echo "Available functions:"
  echo "------------------"

  # Get all function names
  local all_funcs=($(declare -f | grep '^[a-zA-Z_-]*\ ()' | cut -d' ' -f1))

  # Sort functions by category
  local categories=("Git" "Directory" "Docker" "Utility" "ZSH" "Other")

  for category in "${categories[@]}"; do
    echo "\n${category} commands:"
    for func in "${all_funcs[@]}"; do
      local func_category=$(_get_function_info "$func" "category")
      if [[ "$func_category" == "$category" ]]; then
        local desc=$(_get_function_info "$func" "desc")
        if [[ -n "$desc" ]]; then
          printf "  %-15s - %s\n" "$func" "$desc"
        fi
      fi
    done
  done
}

gcurrent () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gcurrent"
    return 0
  fi
  git rev-parse --abbrev-ref HEAD
}

gclean! () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gclean!"
    return 0
  fi
  git clean -f -d
}

# Nuclear option -- remove all changes
gnuke! () {
  gco .
  git reset HEAD .
  gclean!
  git reset HEAD .
  gco .
  gclean!
}

gd () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gd"
    return 0
  fi
  git diff "$@"
}

gds () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gds"
    return 0
  fi
  git diff --staged "$@"
}

gdh () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gdh"
    return 0
  fi
  git diff HEAD\^ "$@"
}

gr () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gr"
    return 0
  fi
  git rebase "$@"
}

gri () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gri"
    return 0
  fi
  gr -i "$@"
}

grc () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grc"
    return 0
  fi
  gr --continue
}

gback () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gback"
    return 0
  fi
  git reset HEAD\^
}

# gh () git open

gac () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gac"
    return 0
  fi
  ga
  gc "$@"
}

gbMerged () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gbMerged"
    return 0
  fi
  git branch --merged | egrep -v "(^\*|$@)"
}

# reset hard to the origin remote of the current branch
grhu () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grhu"
    return 0
  fi
  git reset --hard "origin/$(gcurrent)"
}

# Merge latest main into the current branch
gmm () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gmm"
    return 0
  fi
  current=$(gcurrent)
  git checkout main
  git pull
  git checkout "$current"
  git merge main
}

# Cleanup all except the current and master branches
# Usage: `gbcleanup`
# Flags:
#   -e | --exclude [ex] [ex2]: Exclude branches from deletion
#   -f | --force: Force delete branches
gbcleanup () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gbcleanup"
    return 0
  fi

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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gbsu"
    return 0
  fi
  # Assign branch name to variable
  branch=$(git branch --show-current)
  # If there are no arguments, set the upstream to origin
  if [ "$#" -eq 0 ]; then
    git branch "--set-upstream-to=origin/$branch" "$@"
  else
    git branch "--set-upstream-to=$1/$branch" "$@"
  fi
}

# Commit local changes on top of remote ones
# Stash changes, pull from remote, pop stash, and commit changes
gmk () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gmk"
    return 0
  fi
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

gacm () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gacm"
    return 0
  fi
  gac -m "$@"
}

ga () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ga"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    git add "$@"
  else
    git add .
  fi
}

gp () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gp"
    return 0
  fi
  git pull "$@"
}

gs () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gs"
    return 0
  fi
  git status "$@"
}

gsp () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gsp"
    return 0
  fi
  git stash pop
}

gss () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gss"
    return 0
  fi
  git stash save
}

grs () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grs"
    return 0
  fi
  git restore --staged "$@"
}

gl () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gl"
    return 0
  fi
  git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "$@"
}

gswitch () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gswitch"
    return 0
  fi
  git switch -c "$@"
}

gtrack () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gtrack"
    return 0
  fi
  gco "$@" && gswitch "$@"
}

gco () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gco"
    return 0
  fi
  git checkout "$@"
}

gcoi () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gcoi"
    return 0
  fi
  if gb | grep "#$@"; then
    gco "issue#$@"
  else
    gco dev
    gp
    gco -b "issue#$@"
    gpush
  fi
}

gpush () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gpush"
    return 0
  fi
  git push "$@"
}

gb () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gb"
    return 0
  fi
  git branch "$@"
}

gbd () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gbd"
    return 0
  fi
  git branch -d "$@"
}

gc () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gc"
    return 0
  fi
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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gca"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    git commit --amend "$@"
  else
    git commit --amend
  fi
}

gcaf () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gcaf"
    return 0
  fi
  git commit --amend --no-edit
}

grb () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grb"
    return 0
  fi
  git rebase "$@"
}

g () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "g"
    return 0
  fi
  git "$@"
}

gcp () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gcp"
    return 0
  fi
  git cherry-pick "$@"
}

grh () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grh"
    return 0
  fi
  git reset --hard "$@"
}

gbdelete () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gbdelete"
    return 0
  fi
  # If no args, echo usage
  if [ "$#" -eq 0 ]; then
    echo "Deletes a branch from origin"
    echo "Usage: gbdelete branchName"
    return 1
  fi

  git push origin --delete "$@"
}

glt () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "glt"
    return 0
  fi
  git describe --abbrev=0 --tags
}

glc () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "glc"
    return 0
  fi
  git rev-parse --short HEAD
}

go () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "go"
    return 0
  fi
  # If .git/config contains git@gitlab
  if grep -q "git@gitlab" .git/config; then
    # Save root path to variable
    root="https://gitlab.ssvc.uncd.io"
    # Save organization and project to variables
    org=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $2}')
    project=$(git remote -v | grep fetch | head -n 1 | awk '{print $2}' | sed 's/:/\//g' | sed 's/.git//g' | awk -F "/" '{print $3}')

    # Get MR number associated with branch
    mr=$(git branch -vv | grep $(gcurrent) | awk '{print $3}')
    echo "Opening $root/$org/$project/-/merge_requests"
    branchPath="-/merge_requests"

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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "gwip"
    return 0
  fi
  git commit --no-verify -m 'WIP'
}


# ###############################
# ######## CD SHORTCUTS #########
# ###############################

f () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "f"
    return 0
  fi
  cd $HOME/code/"$@"
}

work () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "work"
    return 0
  fi
  f unchained/"$@"
}

mine () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "mine"
    return 0
  fi
  f mine/"$@"
}

ts () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ts"
    return 0
  fi
  f ts/"$@"
}


notes () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "notes"
    return 0
  fi
  cd $HOME/Dropbox/Notes/"$@"
}

wn_dir () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "wn_dir"
    return 0
  fi
  n Work/"$@"
}

wn () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "wn"
    return 0
  fi
  v $HOME/Dropbox/Notes/Work
}

h () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "h"
    return 0
  fi
  cd $HOME/"$@"
}

desk () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "desk"
    return 0
  fi
  h Desktop/"$@"
}

drop () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "drop"
    return 0
  fi
  h Dropbox\ \(Personal\)/
}

# Login to all the docker registries
dlogin () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "dlogin"
    return 0
  fi
  # Loop through each URL, and login to each one
  urls=("gitlab.ssvc.uncd.io" "gitlab.ssvc.uncd.io:5050" "dockerhub.ssvc.uncd.io")
  for url in $urls; do
    echo "Logging in to $url with token DOCKER_LOGIN_GITLAB_TOKEN"
    docker login $url -u sasha -p "${DOCKER_LOGIN_GITLAB_TOKEN}"
  done
}

# ##############################
# ######### UNCHAINED ##########
# ##############################


ds () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ds"
    return 0
  fi
  source environment.sh && docker-compose run trefoil-setup python
}

emu-shell () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "emu-shell"
    return 0
  fi
  cd ~/cursor/unchained/trezor-firmware && python3 -m poetry shell
}

emu () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "emu"
    return 0
  fi
  cd core && ./emu.py --mnemonic 'merge alley lucky axis penalty manage latin gasp virus captain wheel deal chase fragile chapter boss zero dirt stadium tooth physical valve kid plunge'
}

# ##############################
# ########### OTHER ############
# ##############################

# Prints out tree of all directories below this one
tree () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "tree"
    return 0
  fi
  ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}

ktask () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ktask"
    return 0
  fi
  kill -9 $(ps -x | grep "$@" | awk '{print $1}')
}

kport() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "kport"
    return 0
  fi
  local port=$1
  local pids=$(lsof -ti :$port)
  if [ -z "$pids" ]; then
    echo "No process found running on port $port."
  else
    echo "Killing processes on port $port: $pids"
    kill -9 $pids
  fi
}

tasks () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "tasks"
    return 0
  fi
  ps aux | grep "$@"
}

tg () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "tg"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    terminalgpt "$@"
  else
    terminalgpt
  fi
}

v () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "v"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    cursor "$@"
  else
    cursor .
  fi
}

n () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "n"
    return 0
  fi
  # If there's a bun.lockb in the directory AND there is no package-lock.json, use bun
  if [ -f "bun.lock" ] && [ ! -f "package-lock.json" ]; then
    if [ "$#" -gt 0 ]; then
      bun "$@"
    else
      bun install
    fi
  elif [ -f "yarn.lock" ]; then
    if [ "$#" -gt 0 ]; then
      yarn "$@"
    else
      yarn install
    fi
  elif [ -f "pnpm-lock.yaml" ]; then
    if [ "$#" -gt 0 ]; then
      pnpm "$@"
    else
      pnpm install
    fi
  elif [ -f "pnpm-workspace.yaml" ]; then
    if [ "$#" -gt 0 ]; then
      pnpm "$@"
    else
      pnpm install
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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ns"
    return 0
  fi
  n start
}

nr () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "nr"
    return 0
  fi
  n run "$@"
}

nd () {
  nr dev
}

nnuke () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "nnuke"
    return 0
  fi
  rm -rf node_modules && rm package-lock.json
}

y () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "y"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    yarn "$@"
  else
    yarn
  fi
}

ys () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ys"
    return 0
  fi
  yarn start
}

kport () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "kport"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    npx kill-port "$@"
  else
    echo "Please specify a port"
  fi
}

zsh_edit () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_edit"
    return 0
  fi
  v $ZSH/custom/plugins/functions/functions.plugin.zsh
}

zsh_dir () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_dir"
    return 0
  fi
  $ZSH/custom/plugins/
}

zsh_refresh () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_refresh"
    return 0
  fi
  source ~/.zshrc
}

zsh_reload () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_reload"
    return 0
  fi
  source ~/.zshrc
}

zsh_push () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_push"
    return 0
  fi
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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "bbr"
    return 0
  fi
  bun --bun run "$@"
}

zsh_list () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zsh_list"
    return 0
  fi
  echo "
  zsh_edit - edit the
  zsh_dir - move to the dir
  zsh_refresh - reload
  zsh_push - add, commit, and push
  zshrc - open the file
"
}

zshrc () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "zshrc"
    return 0
  fi
  v ~/.zshrc
}

contains () {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
      show_help "contains"
      return 0
    fi
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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "ngrk"
    return 0
  fi
  ~/ngrok "$@"
}

##
## FFMPEG
##

flacToMP3 () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "flacToMP3"
    return 0
  fi
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
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "grayScale"
    return 0
  fi
  mkdir grayscale
  for file in ./*"$arg"; do
    filename=${file:1}
    newPath="./grayscale${filename}"
    convert "${file}" -fx '(r+g+b)/3' -colorspace Gray $newPath
  done
}

renameBulk () {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help "renameBulk"
    return 0
  fi

  local force=false
  local pattern=""
  local replacement=""

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      --force|-f)
        force=true
        shift
        ;;
      *)
        if [[ -z "$pattern" ]]; then
          pattern=$1
        elif [[ -z "$replacement" ]]; then
          replacement=$1
        else
          echo "Error: Too many arguments"
          echo "Usage: renameBulk [--force] pattern replacement"
          return 1
        fi
        shift
        ;;
    esac
  done

  # Check if required arguments are provided
  if [[ -z "$pattern" || -z "$replacement" ]]; then
    echo "Usage: renameBulk [--force] pattern replacement"
    echo "Example: renameBulk 'currentUsers(\d+\.\d+)\.svg' 'slide\$1.svg'"
    echo "Add --force to actually perform the renaming"
    return 1
  fi

  local changes_found=false

  # Use perl to handle the renaming with regex capture groups
  # Using # as delimiter instead of / to avoid conflicts with paths
  for file in *; do
    local newname=$(echo "$file" | perl -pe "s#$pattern#$replacement#")
    if [[ "$file" != "$newname" ]]; then
      changes_found=true
      if [[ "$force" == true ]]; then
        mv "$file" "$newname"
        echo "Renamed: $file → $newname"
      else
        echo "Would rename: $file → $newname"
      fi
    fi
  done

  if [[ "$force" == false && "$changes_found" == true ]]; then
    echo "\nThis was a dry run. Use --force to actually perform the renaming."
  elif [[ "$changes_found" == false ]]; then
    echo "No files matched the pattern."
  fi
}