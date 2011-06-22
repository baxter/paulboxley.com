Title: Git caret and tilde
Posted: 2011-06-20 19:42Z

I spent a little bit of time playing with Git today, specifically the way that the ^ (caret) and ~ (tilde) work and thought I'd document it here in case I forget.

### The short version

If you want a deeper explanation skip down to "The long version".

`ref~` is shorthand for `ref~1` and means the commit's first parent. `ref~2` means the commit's first parent's first parent. `ref~3` means the commit's first parent's first parent's first parent. And so on.

`ref^` is shorthand for `ref^1` and means the commit's first parent. But where the two differ is that `ref^2` means the commit's ***second parent***.

The ^ and ~ operators can be combined.

Here's a diagram showing how to reference various commits using HEAD as the starting point.

![Referencing commits from HEAD using ~ and ^](http://static.paulboxley.com.s3.amazonaws.com/git-head.png)

### The long version

I've created a dummy repository with several commits in it.

    $ git log --graph --oneline
    * 8329384 Seventh commit
    *   f5717b0 Merge branch 'my_branch'
    |\  
    | * 956c87d Fourth commit on a branch
    * | a8fe411 Sixth commit
    |/  
    * c7c2590 Third commit on a branch
    * 86362ff Second commit on a branch
    * 748855b First commit on a branch
    * 1855b25 Fifth commit
    * 67cf3a7 Fourth commit
    * ea29778 Third commit
    * 28c25b1 Second commit
    * cd00b76 First commit
    
Starting at the bottom, the early commits were made straight onto master.

The commits starting at `748855b` and moving up to `c7c2590` were made on a branch and merged into master, but no changes had been made on master in the mean time.

The commits `a8fe411` and `956c87d` were made on separate branches at the same time. They were merged together in commit `f5717b0`.

Finally, `8329384` was committed straight onto master.

We can use `git show` to look at individual commits.

You'll already know that `HEAD` points to the tip of the current branch:

    $ git show --oneline HEAD
    8329384 Seventh commit
    ...

Putting the caret symbol (^) next to a commit means the parent of that commit. So the following will show the parent of `HEAD`:

    $ git show --oneline HEAD^
    f5717b0 Merge branch 'my_branch'
    ...

`HEAD^` is shorthand for saying `HEAD^1`, which literally means show me parent 1 of that commit. You can also say `HEAD^2` but in this instance it won't make any sense:

    $ git show --oneline HEAD^2
    fatal: ambiguous argument 'HEAD^2': unknown revision or path not in the working tree.
    Use '--' to separate paths from revisions

Because `HEAD` only has 1 parent.

But `f5717b0`, the point where the two branches were merged, has two parents, one on master and one on the branch:

    $ git show --oneline f5717b0^1
    a8fe411 Sixth commit
    ...
    
    $ git show --oneline f5717b0^2
    956c87d Fourth commit on a branch
    ...

The tilde symbol (~) works in a similar way. In fact `HEAD~` will reference the same commit as `HEAD^`:

    $ git show --oneline HEAD~
    f5717b0 Merge branch 'my_branch'
    ...

Again, `HEAD~` is shorthand for `HEAD~1`, but here this means the first ancestor of `HEAD` – `HEAD~2` is not the second parent of `HEAD` but the grandparent of `HEAD`:

    $ git show --oneline HEAD~1
    f5717b0 Merge branch 'my_branch'
    ...
    
    $ git show --oneline HEAD~2
    a8fe411 Sixth commit
    ...
    
    $ git show --oneline HEAD~3
    c7c2590 Third commit on a branch
    ...

As you can see, `956c87d Fourth commit on a branch` is not visible when using the tilde operator. This is because the tilde operator always presumes you want to view the first parent's parent.

To access the second parent's parent the tilde and caret symbols can be combined:

    $ git show --oneline HEAD~1^1
    a8fe411 Sixth commit
    ...
    
    $ git show --oneline HEAD~1^2
    956c87d Fourth commit on a branch
    ...

In this way you should be able to reference any commit in your repository's history.