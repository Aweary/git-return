#!/usr/bin/env bash
# Checks out the master branch, pulls from a remote origin, then prompts
# The user to delete the passed branch locally and remotely.

read -p "Are you sure you want to delete '"$1"'? (y/n): " answer
if [ "$answer" = "y" ]; then
  git checkout master;
  git pull;
  git branch --delete "$1";
  read -p "Delete '"$1"' from remote origin as well? (y/n): " delete_originy
    if [ "$delete_origin" = "y" ]; then
      git push origin --delete "$1";
    fi
else
  echo "OK, we wont."
fi
