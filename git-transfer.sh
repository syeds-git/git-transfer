#!/bin/bash
oldRepo=
oldRepoFolder
newOrigin=
migrateBranches=0

git clone $oldRepo
cd $olRepoFolder

if [ $migrateBranches -eq 1 ]
then
    # get all branch names except for master which we already have 
    branches=`git branch -a | grep remotes | grep -wv origin/master`
    
    for branch in $branches
    do
        echo "Processing branch: $branch"
        localBranch="${branch/"remotes/origin/"/""}"
        #create local copies
        git checkout -b $localBranch origin/$localBranch
        git checkout master
    done
  fi
  
  git remote add new-origin $newOrigin
  git remote -v
  git push --all new-origin
  git push --tags new-origin
  
  #(Option 1) replace origin with new origin or (Option 2) check out new-origin separately and discard this folder in your local
  git remote rm origin
  git remote rename new-origin origin
  git remote -v
  
  
   
