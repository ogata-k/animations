# Animations (this app)
このFlutterプログラムはいろいろなアニメーションをお試しするためのものです。
アプリ実行後、初めの画面に表示される一覧から確認したいアニメーションに遷移できます。
もし遷移後のアニメーションはbase/AnimationPageBaseをMix-inしていれば、
mainの_animationPagesに追加するだけで自動的に一覧に追加されます。
また、my_icon/MyIconを使うと私のアイコンがおもちゃとして利用できるようになります。
（アイコンが白なので枠をつけてあります。）

ちなみにPRは大歓迎です。
ただし、アニメーション表示画面のイメージを合わせるために、
右下に再生ボタンがついたScaffoldのbase/AnimationPageScaffoldを利用してください。


# References
いくつか参考にさせていただいた参考資料を以下に挙げておきます。
* [Flutterのお手軽にアニメーションを扱えるAnimated系Widgetをすべて紹介](https://medium.com/flutter-jp/implicit-animation-b9d4b7358c28)