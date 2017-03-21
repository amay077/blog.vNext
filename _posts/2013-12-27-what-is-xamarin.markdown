---
layout: post
title: "Xamarin(ザマリン) とはなんぞや"
date: 2013-12-01 0:00
comments: true
categories: [Xamarin, XAC13, iOS, Android, C#]
---

【2017年3月時点の情報で更新しました。】
元は、[Xamarin Advent Calendar 2013](http://qiita.com/advent-calendar/2013/xamarin) の記事でした。
<!--more-->

Xamarin(ザマリンと読みます) とはなんぞや、個人開発者として使う時にどうなるの、的な事をさらっと書いてみようと思います。

Xamarin は 2016年2月、Microsoft に買収され、 Visual Studio に無償で同梱されることになりました。

* [【速報】Xamarin のこれからについて！ - Xamarin 日本語情報](http://ytabuchi.hatenablog.com/entry/ms-xamarin)
* [Xamarin が Microsoft に買収された結果 - Qiita](http://qiita.com/amay077/items/6e5c40abe0c21fc79e6a)

Xamarin 自体は元企業名であり、その歴史は .NET の Linux 版を開発していた Ximian という企業が Novell に買収されて、その後レイオフされて作った企業で・・・した。
このあたりの歴史については [@atsushieno さん](http://atsushieno.hatenablog.com/entry/2013/12/24/213950) や [ちょまどさん](https://blogs.msdn.microsoft.com/chomado/xamarin/xamarin-history-as-a-company/) のブログが（読み物としても）おもしろいです。
Microsoftに買収されたことにより企業としての Xamarin はなくなりますが、現在のところ Xamarin という開発ツールの名称は、Visual Studio や、Xamarin Studio の中に見ることができます。

* [Xamarin - Official site](http://xamarin.com/)
* [Xamarin - Wikipedia](http://ja.wikipedia.org/wiki/Xamarin)

で、同社が開発した、 .NET技術で iOS や Android アプリが作成できる SDK が、Xamarin.iOS だったり、Xamarin.Android だったりするわけですが、それらに Mac アプリを開発できる Xamarin.Mac や、Xamarin Studio という統合開発環境を加えたツール群をまるごとひっくるめて Xamarin と呼んでいます。
（Xamarin社は他にも、クラウド上で実機テストができる [Xamarin Test Cloud](https://www.xamarin.com/test-cloud), C#のPlaygroundツール[Xamarin Workbooks](https://developer.xamarin.com/guides/cross-platform/workbooks/) などのプロダクトがあります）

## 作成できるアプリケーション

開発ツールの Xamarin を利用して作成できるアプリは、まず以下のものがあります。

* Mono を利用したアプリケーション、クラスライブラリ
* iOSアプリ(Xamarin.iOS)
* Androidアプリ(Xamarin.Android)
* macOSアプリ(Xamarin.Mac)
* 複数のプラットフォームで再利用可能なクラスライブラリ(PCL)

さらに、 Xamarin.Forms というフレームワークによって、以下のアプリも作成可能です。

* Windowsアプリ（UWPのみ）
* Tizenアプリ（※開発中）

Windows 用の .NETアプリ(Windows.Forms や WPF)は、Xamarin 自体では作成できません。それは Visual Studio の役割です。ただ、PCL(Portable Class Library)と呼ばれる、プラットフォームを問わず動作するアセンブリ(DLL) を作成できますし、そもそも Mono と .NET の API はほとんど同じなので、書いたコードは Windows でも流用できます。

## どこが共通化できる？

まず、Xamarin.Android, Xamarin.iOS, Xamarin.Mac が提供するのは、

**各プラットフォーム(PF)版の.NET API ＋ 各PFのAPIの.NETラッパクラス**

です。

「各PF版の.NET API」とは、いわゆる基本クラスで、基本的な型だったり、文字列処理だったり LINQ だったりその他もろもろです。

一方、「各PFのAPIの.NETラッパクラス」とは、Android なら Android SDK、iOS なら CocoaTouch の API を .NET で記述できるラッパーです。ここにプラットフォーム間の互換性はありません。

なので、画面を作るのに Xamarin.Android なら ``Activity`` クラスを使いますし、Xamarin.iOS なら ``ViewController`` クラスを使います。
GPS を使うのに、.Android なら ``LocationManager`` を使いますし、.iOS なら ``CLLocationManager`` を使います。

つまり、共通にできるのは「コア」な部分だけで、「画面」と「各PF固有の機能」は共通化することができません。従って、各プラットフォーム の API は理解しておく必要があります。それから .NET Framework の基本クラスライブラリも。

上司に言うと「なんだその程度か」と返されると思いますが、コア部分だけでも、 **Javaと Swift でそれぞれ実装しなくて良い** というのは十分に価値があると思うんですよね僕は。

* [XamarinでWindows / Mac OSX 両対応のデスクトップアプリを作る](http://qiita.com/okajima/items/8ca53ff00a825f28dbc6)

は、異なるプラットフォームで共通化できる箇所が具体的に示された有益な情報です。

ほかのクロスプラットフォーム開発可能な SDK（Titanium とか Abobe AIR とか）との比較はこちら → かきました : [Xamarin vs 他のクロスプラットフォーム開発ツール](http://qiita.com/amay077/items/01917ef1be3da9259348)

## 画面まで共通化できる [Xamarin.Forms](https://www.xamarin.com/forms) 

これはいわゆる Titanium や Adobe Air, Delphi XE と同じアプローチで、共通の画面定義体から、各種プラットフォーム（Android, iOS, Windows Phone, UWP＜Universal Windows Platform＞）向けの画面を生成します。Adobe Air, Delphi XE と異なるのは、それぞれのプラットフォームが提供するUIパーツが使用されるという点です。
画面定義体は XAML（ザムル, WPF のそれとは違います）か C＃ のコードで記述します。他にも ValueConverter, バインディング可能なプロパティなど .NET アプリ開発者に馴染みのある要素を使って開発できます。
XAML のグラフィカルなエディタはないので手書きするしかありませんが、 [XAML Previewer for Xamarin.Forms](https://developer.xamarin.com/guides/xamarin-forms/xaml/xaml-previewer/) や、 [Gorilla Player](http://gorillaplayer.com/) を使って、リアルタイムにプレビューさせることができます。

このXamarin.Formsフレームワークの活用は広がりを見せていて、以下のものに対応（または目下対応中）します。

* Android
* iOS
* UWP
* macOS
* Tizen

2016年11月に、[TizenがXamarin.Forms対応プラットフォームに加わった事](http://nakasho-dev.hatenablog.jp/entry/2016/11/18/030310)は、ちょっとした驚きとともに迎え入れられました。今後は [WPF への対応もあるかも](https://twitter.com/migueldeicaza/status/827220707465654272) しれません。

Xamarin.Formsは発展途上でも何でもありません。**実戦投入できるフレームワーク** です。
複数プラットフォームで辻褄を合わせて共通なインターフェースとして公開しなければならないので、提供されるUIコントロールは少ないですが、Xamarin.Android, Xamarin.iOS の上に成り立っているので、 **ネイティブの部品をXamarin.Forms化することは容易** です。なぜならネイティブのAPIも同じ言語で同じIDEを使って開発・デバッグできるからです(例えば React Native では、AndroidネイティブのAPIをJavaScript側にブリッジする箇所は Java で**書か**なければなりません)。

## Macの人は Xamarin Studio or Visual Studio for Mac、Win の人は Visual Studio で開発しますよ

Mac 向けの Visual Studio、[Visual Studio for Mac](https://www.visualstudio.com/ja/vs/visual-studio-mac/) がプレリリースされています。
が、この中身は実質 Xamarin Studio です。
Xamarin Studio もしばらくは Visual Studio for Mac と同じ機能を搭載していくようなので、どちらを使ってもよいです。ただ Visual Studio for Mac はプレビュー版なので、お仕事などでは Xamarin Studio の方が **まだ** いいでしょう。

Windows の場合、Visual Studio 2015 に同梱されるようになり、また無料化されたため、 Visual Studio Community でも利用できるようになりました。
(同時に、これまで提供されてきた Windows版の Xamarin Studio は、提供終了となりました。)
環境構築でハマることが多い Visual Studio 2015 + Xamarin ですが、Visual Studio 2017 では、Xamarin のインストールが簡単になっているそうです。
[Visual Studio 2017 のリリース日は 2017年3月７日](http://forest.watch.impress.co.jp/docs/news/1043543.html)とのことなので、期待して待ちましょう。（VS2017のプレビュー版はVS2015のXamarinと共存できません）

また iOS アプリを開発する場合は、ビルドや実行・デバッグのために Mac が必要なので、現実的には Mac 必須です。これは買収された後も変わっていません。
Remoted iOS Simulator (for Windows) が搭載され、Windows の画面でアプリを実行することができるようになりましたが、iOS アプリのビルドには Mac がどうしても必要になります。

## Xamarin のコアライブラリはオープンソースになりました

Xamarin.Android, Xamarin.iOS, Xamarin.Mac, Xamarin.Forms のこれまでプロプライエタリだったライブラリ群は、いずれもMITライセンスによるオープンソースになりました → [Xamarin Open Source SDK](http://open.xamarin.com/)
同じくランタイムである Mono も MITライセンス になりました。

Xamarin Studio の IDE としての機能は元々オープンソースである MonoDevelop なので、純粋な Mono アプリケーションを作成するのにも使用されます。Xamarin Studio の Xamarin固有のプラグイン部は、オープンソース化されないとのことです。つまり、Microsoftとしては「開発ツールが収益源」ということになります。

## 価格

Xamarin自体は無償になりましたが、企業利用の場合、大抵は Visual Studio の購入が必要になります。

### 個人の場合

Windowsの人は、[Visual Studio Community](https://www.visualstudio.com/ja-jp/products/visual-studio-community-vs.aspx) で開発・配布ができるようになりました。
Macの人は、[Xamarin Studio](https://www.xamarin.com/studio)で（もちろん Visual Studio for Mac でも） 開発・配布ができるようになりました。

### 企業の場合

Windowsの人は、Visual Studio のサブスクリプションの購入が必要です。
Macの人は、Xamarin Studio で開発を行いますが、Windowsと同様、Visual Studio サブスクリプションの購入が必要です。

詳しくは、 [Xamarin の開発環境を整理しよう - Xamarin 日本語情報](http://ytabuchi.hatenablog.com/entry/2016/04/02/163106) を参考に、あるいは Microsoft へ問い合わせてください。

[@nuits_jp](https://twitter.com/nuits_jp) さんが「絶対わかるXamarinライセンスの判断方法」を書いてくれました！

* [絶対わかるXamarinライセンスの判断方法 - nuits.jp blog](http://nuits.hatenadiary.jp/entry/2016/07/11/231323)

## 日本語情報について

2016年現在、Xamarin の日本語情報もだいぶ増えてきました。

### 書籍

2017年3月、続けざまに2冊のXamarin本が発売されます。ちょっとずつ増えていく予感がしますね。

#### [Xamarinエキスパート養成読本 (Software Design plus)](http://amzn.to/2nExEQ0)

#### [Xamarinではじめるスマホアプリ開発](http://amzn.to/2nEBKrD)

#### [C#によるiOS、Android、Windowsアプリケーション開発入門](http://www.amazon.co.jp/dp/B00MN5P6PY/?tag=oku2008-22)

内容は少し古いですが、基礎の理解には問題ありません。

#### [.NET開発テクノロジ入門2016年版 Visual Studio 2015対応版](http://www.amazon.co.jp/dp/4822298612/?tag=oku2008-22)

.NET開発全般についての書籍ですが、Xamarinについての章があります。C＃/.NET自体もこれから勉強するという方にはふさわしいでしょう。

#### [かずきのXamarin.Forms入門（Kindle版)](http://amzn.to/2l7oQNK)

元MVPで現Microsoftの中の人 @okazuki さんによる自費出版本です。Xamarin.Formsの日本語での入門にはピッタリです。

### Webサイト、ブログ

* [ものがたり](http://atsushieno.hatenablog.com/) - Xamarin の中の人である [@atsushieno](https://twitter.com/atsushieno) 氏のブログ
* [ちょ窓帳 – 千代田まどか(ちょまど)のブログ](https://blogs.msdn.microsoft.com/chomado/) - Microsoftエバンジェリストのちょまどさんのブログ
* [Xamarin 日本語情報](http://ytabuchi.hatenablog.com/) - Xamarinコミュニティ(JXUG)主宰の @ytabuchi さんのブログです。
* [Xamarin逆引きTips - Build Insider](http://www.buildinsider.net/mobile/xamarintips) - Xamarinに関するTipsが集まっています
* [Qiita の "Xamarin" タグ](http://qiita.com/tags/xamarin/items)
* [Experiments Never Fail](http://blog.amay077.net/) - ワタシのブログです😅
* [teratail の "Xamarin" タグ](https://teratail.com/questions/search?q=Xamarin) - 分からない事はここで聞いてみると大抵回答があります

### コミュニティ

* [Japan Xamarin User Group (JXUG)](http://jxug.org/) - @ytabuchi さんが代表と務められているコミュニティ。定期的に勉強会、ハンズオンなどを開いています。
* [JXUG - connpass](https://jxug.connpass.com/) - 登録しておくとXamarinのハンズオンや勉強会の通知を受け取れます

Microsoft に買収され、より多くの人に知ってもらえ、使ってもらえるようになった Xamarin、事実上クロスプラットフォーム開発の最良の選択肢になったと言えますね。

## 最後に注意点

Visual Studio ＋ Xamarin はクロスプラットフォームアプリ開発が行える非常に強力な開発ツールですが、Android や iOS のアプリ開発の知識は **必須** です。

また、Visual Studio は最強のIDEであるのはその通りですが、Androidアプリ開発には Android Studio、iOSアプリ開発にはXcodeという公式な開発ツールがあり、それらの方が便利な機能もあります。

そのため、Android Studio や Xcode で Android、iOSアプリを開発できるようになった上で、Visual Studio+Xamarin でクロスプラットフォーム開発をするのが、最大の効果を得られる方法です。

**Java も Swift も覚えて C# で D.R.Y(Don't Repeat Yourself) するのが Xamarin です**

### PR

* [DroidKaigi2017で「Xamarin.Android で始めるクロスプラットモバイルアプリ開発」という話をしました](http://blog.amay077.net/blog/2017/03/10/had_a_session_about_xamarin_android_in_droidkaigi2017/)
* [技術書典2](https://techbookfest.org/event/tbf02/circle/5699714196439040) に、他数名の方と、Xamarinに関する技術本を出します。
