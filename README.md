# 不完全なデーモンプロセスに制御端末を割り当てる方法を教えてください

UNIX のデーモンプロセスについて勉強しています。デーモンプロセスを作るには、

1. fork する (子プロセスを作って親は死ぬ)
2. setsid する (子プロセスを制御端末から切り離す)
3. もう一度 fork する (セッションリーダーではない孫プロセスを作って子は死ぬ)

という手順を踏むのだと、後述のブログ記事等で知りました (chdir, umask, STDIN/STDOUT/STDERR などの取り扱いは、今回は注目しないので省略します)

この 3. でやっている二度目の fork が必要な根拠として、セッションリーダーであるデーモンプロセス (1. で fork した子プロセス) に制御端末を割り当てられてしまうとまずいためだ、という理由が挙げられています (シグナルを送られてプロセスを操られてしまうとか)。まずいケースを実体験したいのでそのようなプロセスに制御端末を割り当ててみたいのですが、やり方がわかりませんので教えてください。

[https://github.com/kyanny/sample-daemon](https://github.com/kyanny/sample-daemon) に Ruby で書いたサンプルプログラムがあります。 ps.txt はこれら三つのプログラムを起動したときに ps(1) コマンドでどのように見えるかのスナップショットです。

可能であれば、 sample-daemon-setsid.rb を改変して、制御端末を割り当てるようなコードを追加してください。  ps(1) でみたときに制御端末が割り当てられていることを確認できる、実際に動作するコードをお願いします。 Ruby, Perl, Python 等による例が嬉しいですが、 C や Java 等のコードでもかまいません。もし Ruby や Perl では制御端末を割り当てることができない場合、その理由も教えてください。


参考にしたブログ記事等

- [http://d.hatena.ne.jp/sleepy_yoshi/20091011/p2](http://d.hatena.ne.jp/sleepy_yoshi/20091011/p2)
- [http://d.hatena.ne.jp/sleepy_yoshi/20100228/p1](http://d.hatena.ne.jp/sleepy_yoshi/20100228/p1)
- [https://www.codeblog.org/blog/akr/200511.html](https://www.codeblog.org/blog/akr/200511.html)
- [http://mkosaki.blog46.fc2.com/blog-entry-1147.html](http://mkosaki.blog46.fc2.com/blog-entry-1147.html)
- [http://pinka99.ddo.jp/nanao/work/daemon.html#_Toc3](http://pinka99.ddo.jp/nanao/work/daemon.html#_Toc3)

