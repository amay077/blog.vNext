---
title: "Xamarin.iOS でエラー “Failed to load AOT module ... in aot-only mode”"
date: 2014-01-16
tags: [Xamarin, iOS, C#]
layout: layouts/post.njk
page_name: failed-to-load-aot-module-in-aot-only-mode
permalink: "/blog/{{ page.date | date: '%Y/%m/%d' }}/{{ page_name }}/index.html"
---
Xamarin.iOS で Binding プロジェクトをプロジェクトに追加して実機で実行したら、起動時に落ちるようになってしまった。
<!--more-->
Xamarin.iOS で Binding プロジェクトをプロジェクトに追加して実機で実行したら、起動時に落ちるようになってしまった。

ログには、

>Failed to load AOT module ‘/xxx/Hoge.dll.dylib' in aot-only mode.

というエラーが出ていた。

実機からアプリを削除して、
ソリューションを「再ビルド」したら直った。小ネタ過ぎる。

## 参考

* [MonoTouch - Failed to load AOT module ... in aot-only mode](http://monotouch.2284126.n4.nabble.com/Failed-to-load-AOT-module-in-aot-only-mode-td4602614.html)