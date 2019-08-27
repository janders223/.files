''
  [user]
    name = Jim Anders
    email = jimanders223@gmail.com
  [alias]
    s = status -sb
    ci = commit
    ap = add --patch
    all = commit -am
    br = branch
    di = diff
    dic = diff --cached
    lg = log -p
    lol = log --graph --decorate --pretty=oneline --abbrev-commit
    lola = log --graph --decorate --pretty=oneline --abbrev-commit --all
    ls = ls-files
    ign = ls-files -o -i --exclude-standard
    unstage = reset HEAD --
    prev = checkout -
    discard = checkout -- 
    ctags = !.git/hooks/ctags
  [color]
    ui = auto
  [core]
    whitespace=fix,-indent-with-non-tab,trailing-space,cr-at-eol
    editor = vim
    quotepath = false
    excludesfile = /etc/per-user/.gitignore
  [credential]
    helper = osxkeychain
  [github]
    user = janders223
  [merge]
    tool = fugitive
  [mergetool]
    keepBackup = true
  [mergetool "vimdiff4"]
    cmd = vim -d $LOCAL $BASE $REMOTE $MERGED -c '$wincmd w' -c 'wincmd J'
  [mergetool "fugitive"]
    cmd = vim -f -c "Gdiff" "$MERGED"
  [filter "media"]
    clean = git-media-clean %f
    smudge = git-media-smudge %f
  [push]
    default = current
  [init]
    templatedir = /etc/per-user/.git_template
  [http]
    proxy = http://127.0.0.1:3128
  [https]
    proxy = http://127.0.0.1:3128
''
