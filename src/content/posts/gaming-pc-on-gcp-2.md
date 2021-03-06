---
title: "GCP 上にゲーミング PC をこさえて少し運用してみたら毎月およそ 3,000 円 だよ"
date: 2020-09-07T22:09:53+09:00
categories: [GCP, ゲーム]
---

[GCP 上にゲーミング PC をこさえてみたが 2 日で 800 円だよ](/blog/2020/06/30/gaming-pc-on-gcp/) という記事のその後。

<!--more-->

先述の記事は 2020-06-30 に書いた。
この記事を書いている今日が 2020-09-07 であるので、つまり 2 ヶ月ほど ゲーミング PC on GCP を使ってみたことになる。ちょっと途中経過を書いておく。

## TL;DR

2020-08 のゲーミング PC on GCP のお値段は、**およそ 12 時間 30 分起動で、3,096 円** だった。

<br>
以下、諸々いじったところとか所感とか。

## プレイ時間を計測する仕組みを作った

どれくらい使うとどれくらいのお値段になるのかしら？というのが知りたかったのであるが、「どれだけ GCE が起動していたか」というメトリックスをとるための機能が GCP にはなさそうに見えた (あったらごめん)。

なので、Cloud Functions と Cloud Pub/Sub と Cloud Scheduler を合わせて、「毎分 GCE に稼働状態を問い合わせて RUNNING だったら記録する君」をこしらえた。保存先は Datastore 。

<div style="max-width: 500px">
  <a href=https://github.com/pankona/gce-vm-launcher><img src=/images/gce-vm-launcher.png /></a>
</div>

## ストレージを小さくした

それはそうと、2020-07 の段階では 500 GB くらいのストレージを扱うように設定していた。昨今のゲームはインストールするだけでもそれなりに容量食うからね、等と思いつつ。
その後同僚に教えてもらって気付いたのだけれども、このストレージを維持するというのがそれなりに (個人にとっては) 高額で、500 GB のストレージだと維持費が一日あたり 100 円くらいになってしまう。
これはつまり一ヶ月が 30 日あるならばストレージを維持するだけで 3,000 円かかってしまうことになる。お高い。

なので、その後ストレージの容量を減らして 100 GB で運用していくようにしてみた。これなら一日およそ 20 円くらい。一ヶ月 30 日あるならば 600 円。ま、まあこれくらいなら？

正直 100 GB だとそれなりのゲームを 2、3 本いれたらカツカツになってしまうことは目に見えているので、「主にやるゲーム」を選定してそうでないものはアンインストールしておくみたいな運用になりそうな…。

## プリエンプティブやめた

当初はお値段の関係からプリエンプティブ (つまりいきなり VM が死ぬのを許容する代わりにお値段が安いモード) でやっていたのだが、思ったより結構落ちる (一日一回は落ちていた気がする) ことが分かってきて結構ストレスだった。
ひとりプレイなゲームならまだしも、マルチプレイしていると「あーごめーん落ちたわー、すぐ戻るから待っててー」などのコミュニケーションが発生してしまい、これはなかなかね、なかなか無理という感じでした。
プリエンプティブで運用するのは無理と判断して、いったん普通のインスタンスに変えてみた。プリエンプティブと比べたら倍以上ランニングコスト高いんだけどやむなし。

## そんなわけで 2020-08 の結果

2020-07 の当初はストレージ容量 500 GB でやってたみたいなところもあり、お値段の計算としてはノーカン扱いとした (ちなみに 3,600 円くらいだった)。
ということで 2020-08 にあらためて一ヶ月運用してみたところ、結果としては、

**およそ 12 時間 30 分起動で、3,096 円**

というお値段に。
ストレージとか Windows のライセンスフィーとかである程度の固定費があるため、単純にプレイ時間でお値段を割り算しても単位時間あたりのお値段にはならないのだが、とはいえおよそで言うならば **一時間あたり 300 円弱** みたいなお値段だろうか。

## 高い？安い？

毎月 3,000 円の費用ならば 3 年程度でおよそ 10 万円という感じなので、10 万円のゲーミング PC を買って 3 年後に買い換える、みたいなことを考えるならばトントンなのかもしれない。
ただこれは「毎月 12 時間程度のプレイ時間に抑えられるならば」という条件付きなので、まあもうちょっとちゃんとゲームする人ならば全然ペイしないというか、素直にゲーミング PC 買ったほうがいいわね…。 うむ…。
逆にライトなゲーマーであれば、自作 PC をこさえるよりは安くあがる可能性がないわけではなさそう。まあそのような人だったらなおさら月 3,000 円はちょっとお高いという感じになってしまいそうかな。うむ。

なにより、プレイ中に「俺はいまお金を消費しているぞ…」というような強迫観念が脳みそを占めてしまい、ゲームに集中できないという重大な欠点があったりする (感じ方には個人差があるだろうけれども)。

## もう少し続けてみる

ただ、ゲーミング PC をこさえる予定がない (家庭内稟議を乗り越えられない) という我が家の事情に鑑みて、もう少しこの仕組みで粘っていこうと思う。ちょうど楽しみにしていた [Craftopia](https://store.steampowered.com/app/1307550/Craftopia/?l=japanese) が発売したばかりであるし。

なんだかんだいって「PC を置く場所を考えなくてよい」「ストレージが故障したりしない」みたいな要素は快適ではある。つまり早く GeForce Now のラインナップが充実してくれるのを願うばかりである。
