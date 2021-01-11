---
title: "端末をスリープにさせない設定の有効範囲は？"
date: 2012-10-03
tags: [Android]
layout: layouts/post.njk
page_name: range-of-sleep
permalink: "/blog/{{ page.date | date: '%Y/%m/%d' }}/{{ page_name }}/index.html"
---
* [画面をスリープ状態にさせないためには - 逆引きAndroid入門](http://www.adakoda.com/android/000207.html)

について、これってどの期間で有効になるのか気になったので調べてみた。
<!-- more -->
「Activity.onCreate でスリープ抑制、onDestroy で解除」という実装をした時、そのアプリがバックグラウンドにまわった時はどうなるの？というところ。

結論は「ちゃんといい感じで動いてくれた」。
アプリ(というかその Activity)がフォアグラウンドの時は、スリープは期待通り抑制される。
アプリがバックグラウンドにまわった場合は、システムの設定値に応じて、スリープになる。