---
title: "cocos2d-xをやってみている"
date: 2015-03-11 20:29:27 +0900
comments: true
categories: [cocos2d-x]
---

2015.03.07に娘が生まれました。
これからも頑張ります。近況を記す。

### cocos2d-xを始めてみたのである

昨年末からあまりRaspberry Piを触れない環境におかれていたもので、
何か手軽にプログラミングをエンジョイできないかと思って、探して見た結果がcocos2d-x。
Unityじゃなくてcocos2d-xにしたのは、Linux向けの開発環境があるからである。
Unityやってみたかったけど、LinuxでやりたかったらWineを使え、みたいな感じになっているようで、
そんなことこっちから願い下げだ、ということで、cocos2d-x。
C++で書けて、これから触ってみようと思っているLuaとも相性がいい様子で、願ったり叶ったりである。

### いま作っているもの

なかなか始めてみると面白い。
とりあえずわかりやすいところから馴染んでいこうということで、
ブロック崩しを題材にして制作に励んでいるところ。リポジトリはこちら。
[KonaReflection](https://github.com/pankona/KonaReflection)
プロジェクト名は3日程真剣に考えた挙句これである。

開発環境は、愛機のVaio Pro 13（Arch Linux）と職場Mac Book Proの両刀で実践中。
デプロイターゲットはLinux、Mac（いずれもデバッグ目的）、そしてAndroid。
※ 職場MBPを使っているが、ちゃんと仕事はしている。暇なときにやっている。

どこまで作るかという話もあるが、とりあえず誰かを楽しませることが出来るレベルまで作ろうかと思う。
せっかく作るなら、一応、体としてはやりきりたいではないか。

### Longest Streakを13に伸ばす

なんやかやあって途絶えてしまったが、Longest Streakは13まで更新した。
そんなもん伸ばして何になるの、というのもわかるが、ちょっとでも、毎日ソース更新しなきゃ、という気持ちになるのであれば、
意味がなくもないんじゃないかと思いつつ。また仕切りなおして伸ばしていこう。

### cocos2d-xを使ったアプリをEclipseで開発できるようにした

Android向け、という話ではそこそこ記事があるが、ことLinux向けで開発環境構築というと記事がなかなかない。
しかし出来るようになった。Eclipse＋CDT＋諸々設定（←ここがめんどい）。
設定方法は別の記事としてまとめようと思う。cocos2d-x＋Eclipse＋Linux向けビルド、の体。

### vimでも開発できるように調整した

いっときEclipseを用いてcocos2d-xの開発環境を作ることを諦めかけた（めんどすぎた）のだが、
そのとき、Vimだけでやれるように開発環境構築を頑張ってみたのである。
割といい具合になったのでこっちもそのうち記事にしてみようと思う。
Vim＋Syntastic＋NeoComplete＋Clang_Complete、といった組み合わせである。
だけどまあ結局はEclipseを使いそうである。事足りてしまうし、むしろvrapperがあればそこそこ快適である。
