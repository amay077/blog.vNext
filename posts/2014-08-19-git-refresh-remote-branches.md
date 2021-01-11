---
title: "Git でリモートリポジトリの更新が反映されないとき"
date: 2014-08-19
tags: [git, SourceTree]
layout: layouts/post.njk
page_name: git-refresh-remote-branches
permalink: "/blog/{{ page.date | date: '%Y/%m/%d' }}/{{ page_name }}/index.html"
---
GitHub のWebサイトでブランチを削除したあと、クライアント（SourceTreeとか）のリモートブランチの表示に、削除したはずのブランチが残っていて、気持ち悪いなあ、と思っていた。
<!--more-->

git のコマンド一発だった。

```
git remote update -p
```

これでクライアント側のリモート情報がリフレッシュされる。