---
title: "「Skitch PNG」とはなにか？"
date: 2014-08-07
tags: [skitch]
layout: layouts/post.njk
page_name: what-is-skitch-png
permalink: "/blog/{{ page.date | date: '%Y/%m/%d' }}/{{ page_name }}/index.html"
---
画像に文字や図形を描くとき多用している Skitch ですが、ファイルのエクスポートに「Skitch PNG」という謎のファイル形式があるのを発見。
<!--more-->
![](/img/posts/skitch_png_01.png)

調べてみると、

* [Skitch For Mac Updated With A Format That Keeps Annotations Editable](http://www.addictivetips.com/mac-os/skitch-updated-with-a-special-format-that-keeps-annotations-editable/)

> Skitch PNG is a new format for saving pictures that you’ve annotated in Skitch. These are almost like regular PNGs, except that you can open them in Skitch later on and edit the previous annotations. 

な、なんだってー！PNG なのに **「アノテーションが再編集可能」** だってー！！

## 試しに

![](/img/posts/skitch_png_02.png)

[photo by Nesster, CC-BY](http://www.gatag.net/10/16/2009/110000.html)

上の画像、「Skitch PNG」で保存したものですが、Skitch で開き直すと、下図のように文字や矢印が再編集できます。

![](/img/posts/skitch_png_03.png)

これからはこれをデフォで使っていこうと思います。
ちなみに「モザイク」は復元できないみたいです。うむ安全設計。
