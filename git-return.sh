#!/usr/bin/env bash
# Checks out the master branch, pulls from a remote origin, then prompts
# The user to delete the passed branch locally and remotely.

branch_name=`git symbolic-ref --short -q HEAD 2>/dev/null`
if [ -z "$branch_name" ]; then
echo "Woops! no git repository found in `pwd`"
exit
fi
read -p "Are you sure you want to delete '"$branch_name"'? (y/n): " answer
if [ "$answer" = "y" ]; then
  git checkout master;
  git pull;
  git branch --delete "$branch_name";
  read -p "Delete '"$branch_name"' from remote origin as well? (y/n): " delete_origin
    if [ "$delete_origin" = "y" ]; then
      git push origin --delete "$branch_name";
    fi
else
  echo "OK, we wont."
fi
