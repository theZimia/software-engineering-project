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

<br/>

---

# Git Merge, Fast-Forward Merge & 3-Way Merge

A beginner-friendly visual guide with examples and Git commands.

## 1. Git Merge

**Git merge** combines changes from one branch into another branch.

```bash
git switch main
git merge b1
```

These commands switch to `main` and merge the changes from `b1` into it.

## 2. Fast-Forward Merge (Sometimes Informally Called "2-Way Merge")

A **fast-forward merge** occurs when the target branch has not advanced since the feature branch split off. Git can move the target branch pointer forward without creating a merge commit.

### Before merge

![Fast-forward before merge](assets/preview%20images/fast_forward_before.png)

### After merge

![Fast-forward after merge](assets/preview%20images/fast_forward_after.png)

**Key points:**
- No merge commit is created by default.
- Git moves the `main` branch pointer forward to the latest `b1` commit.
- There is no merge conflict during a true fast-forward.

**Commands:**

```bash
git switch main
git merge b1
```

> **Terminology:** A fast-forward merge is not technically synonymous with a *2-way merge*. "2-way" generally describes comparing two versions; Git uses a fast-forward when the history permits a simple pointer move.

## 3. 3-Way Merge

A **3-way merge** is used when the branches have diverged: both have new commits since their shared ancestor. Git combines their changes using three versions: the common ancestor, the current branch, and the branch being merged.

### Before merge

![3-way before merge](assets/preview%20images/three_way_before.png)

### After merge

![3-way after merge](assets/preview%20images/three_way_after.png)

Here **M** is the new merge commit, which has two parents: **D** and **F**.

**The three versions Git compares:**
1. **Base:** The common ancestor of both branches.
2. **Main:** The current version on `main`.
3. **b1:** The current version on `b1`.

**Key points:**
- A merge commit is normally created.
- The branches contain independent commits.
- A merge conflict can happen if Git cannot reconcile overlapping changes automatically.

**Commands:**

```bash
git switch main
git merge b1
```

If there is a conflict, resolve the conflicting files, then stage them and complete the merge:

```bash
git add .
git commit
```

## 4. Quick Comparison

| Feature | Fast-Forward Merge | 3-Way Merge |
|---|---|---|
| Branch history | Target is an ancestor of source | Branches have diverged |
| New merge commit | No, by default | Yes, normally |
| Merge conflict | No | Possible |
| Common ancestor comparison | Not needed | Required |
| Typical result | Branch pointer moves | Two histories join in a merge commit |

## 5. Remember

- **Git Merge:** Combines changes from branches.
- **Fast-Forward Merge:** Moves a branch pointer forward, with no new merge commit.
- **3-Way Merge:** Uses a common ancestor to combine diverged changes, normally creating a merge commit.


