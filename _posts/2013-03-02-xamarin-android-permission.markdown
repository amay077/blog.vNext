---
layout: post
title: "Xamarin.Android で PERMISSION を設定する"
date: 2013-03-02 23:21
comments: true
categories: [Xamarin, Android, C#] 
---
Xamarin.Android でプロジェクト作ると AndroidManifest.xml が見当たらない。
GPS使いたいんだけど権限設定どうしよう、と思ったらこうできました。

<!-- more -->

プロジェクトのオプションから、
!["option"](https://blog.amay0777.net/assets/images/posts/xamarin_android_project_option.png)

ビルド→Android Application と来て、
!["add"](https://blog.amay0777.net/assets/images/posts/xamarin_android_application_add.png)

Add すると権限などが設定できるようになります。
!["added"](https://blog.amay0777.net/assets/images/posts/xamarin_android_application_created.png)

その後、おなじみ AndroidManifest.xml ができてました。
!["source"](https://blog.amay0777.net/assets/images/posts/xamarin_android_androidmanifestxml.png)

Activity の設定はオートでやってくれるみたいなのでありません。
これでオレオレ Applocation クラスも動かせるのかなあ。。。
