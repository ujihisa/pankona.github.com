---
layout: post
title: "hololens_dev"
date: 2017-02-22 13:15:27 +0900
comments: true
categories: 
---

hashtag は #holodev101

## Hololens の紹介

* PCとどうやって接続するの？とよく聞かれる。
    *  接続しない。スタンドアローンで動作する。

* kinect のチームが hololens を作った

* HPU (ホログラフィック プロセシング ユニット)。額の部分に埋め込まれている。

* 解像度は 2.5k/radian。ラジアン単位で考えられている。

* スペックは言うほどそんなリッチでない
    * Intel 32bit の CPU
    * 64GB Flash
    * 2GB RAM
    * ファンレス

* 実際の物質に視界が遮られると、ホログラムも一部見えなくなる
* 空間にホログラムを固定するする力は hololens がずば抜けている

* OS は Windows 10。設定項目等に違いはあるものの、基本的に同じ。
    * Update も降ってくるのでデモ中は Update 切ろうね。
    * UWP で作ってストアにアップロードすることも可能。
    * Excel も動きます。仮想ワークスペースとして使うやり方もあり。

* 商用版では kiosk モードにできる

* 日本語はいつ打てるようになる…？
    * いつになるという情報はないが、いつ対応か、という感じ。


* アプリは 2D か 3D
    * Visual Studio 2015 Update 3 以降
    * 2D は UWP (Universal Windows Platform) アプリしか動かない
        * 普通の Windows 10 アプリを作る要領で。
    * 3D は DirectX か Unity か。
        * 実機がなければエミュレータ (Hyper-V)
    * Vuforia

* PC と hololens の接続 (Device Portal)
    * https://(hololens の IP アドレス)
    * USB で結線した場合は https://127.0.0.1:10080

* Device Portal
    * ストリーミング再生できる
    * 録画、写真撮影も可能
    * System -> Apps でデバイスマネージャ的なやつ

* 北米向けにしかリリースされていないアプリもあるが…
    * 一時的にロケールを米国にすることでインストールできる

* hololens は光の足し算。引き算はできない。
なので明るいところだときつい。透明になっちゃう。

* Unity での開発準備
    * カメラが自分自信。カメラの座標を 0 にする
    * 空が自動で生成されるので、透明 (黒一色) にする。
    * キューブを置く。x0 y0 z2 に設定。単位はメートル。
    * 設定で Quority を変える。Fastest にする。レスポンスをあげるため。
    * SDK Universal10、Target device Hololens、UWP Build Type D3D 
    * Virtual Reality Standard にチェック
    * その後、Visual Studio 向けにプロジェクトを吐き出す
* Visual Studio の設定
    * DeviceFamily → Windows.Universal ではなく Windows.Holographic に
    * Release版おすすめ、CPU は 32bit 向けのものを選択。

* 開発を楽にする技
    * holographic remoting
    * Unity から なんとか Emulation。Remote Device を選ぶ。

* Gaze の表示はデフォではない。デベロッパーの責任。
* 物理的なオブジェクト（壁とか）の認識 (Spatial Mapping) はデフォではされない。

* Hololens Toolkit (GitHub で公開している)
    * アセットをそのまま使えばデフォでないものもデフォになる。
    * prefabs に色々入ってる。Spatial Mapping も。

* hololens academy というのがある。チュートリアルできる (いまのところ英語版のみ)


* 開発する際の注意点
    * 万能ではない。視野角とか。ハードウェアの特性を理解して作ること。
    * ポリゴン数多くしすぎない。
    * 広い空間では見てほしい方向にナビゲーション
    * ホログラムは触らせないほうが良い。なので近くても 1 メートルより先。
