<!-- git command cheatnote -->
# Git Command
- <b>git pull origin main</b> :  for take the others push on repo.
- <b>git add "filename.extention" / git add all(.) </b> : for adding on repo 
- <b>git commit -m "Describe your changes" </b> : store the github history.
- <b>git push origin main </b>: for send the all data on repo.
- <b>git branch "branch-name"/ git switch -c branch-name/git switch branch-name </b> : this is use for making branch or move on the one branch to another branchcls
- <b> git merge branch_name </b> : this cmd use for marging the bracnes with main branch.

<br/>

# When to Use Which Git Command? & one line command.

| Command | Situation |
| ------- | --------- |
| git commit -am "msg" | Edit an existing tracked file |
| git add . && git commit -m "msg" | Create a new untracked file |
| git commit -am "msg" | Delete a tracked file |

Remember: git commit -am "msg" does not add new untracked files.