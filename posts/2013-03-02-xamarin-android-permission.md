---
title: "Xamarin.Android で PERMISSION を設定する"
date: 2013-03-02
tags: [Xamarin, Android, C#] 
layout: layouts/post.njk
page_name: xamarin-android-permission
permalink: "/blog/{{ page.date | date: '%Y/%m/%d' }}/{{ page_name }}/index.html"
---
Xamarin.Android でプロジェクト作ると AndroidManifest.xml が見当たらない。
GPS使いたいんだけど権限設定どうしよう、と思ったらこうできました。

<!-- more -->

プロジェクトのオプションから、
!["option"](https://blog.amay0777.net/img/posts/xamarin_android_project_option.png)

ビルド→Android Application と来て、
!["add"](https://blog.amay0777.net/img/posts/xamarin_android_application_add.png)

Add すると権限などが設定できるようになります。
!["added"](https://blog.amay0777.net/img/posts/xamarin_android_application_created.png)

その後、おなじみ AndroidManifest.xml ができてました。
!["source"](https://blog.amay0777.net/img/posts/xamarin_android_androidmanifestxml.png)

Activity の設定はオートでやってくれるみたいなのでありません。
これでオレオレ Applocation クラスも動かせるのかなあ。。。
