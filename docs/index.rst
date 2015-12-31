.. Sphinx-book documentation master file, created by
   sphinx-quickstart on Wed Dec 30 21:01:24 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

==============================
Sphinx本 著者ミーティング 6/30
==============================

開催情報
========

1. 日時: 2013/06/30 10:00 - 12:00
2. 場所: 曙橋
3. 参加者: shimizukawa, tk0miya, usaturn, r_rudi

この本を執筆する目的
====================

Sphinxユーザ会のサイトで、多くの情報を提供しています。しかし、書籍という形でSphinxの基礎をまとめることに意味がある、と私たちは考えました。

この本の目的を、本書の前書き案から引用します。

  この本は、Sphinxを始める際によくある疑問やつまづきを解消し、基本的な書き方、使い方を理解できるように執筆しました。

  Sphinxが今までよりも始めやすく、また、人に勧めやすくなること、そして、Sphinxの公式ドキュメントを読みこなすために十分な基礎知識を伝えることがこの本のゴールです。

進捗状況について
================

まず進捗状況の共有を行いました。前回5月13日のミーティングからの進捗確認です。

* 前書き: **未着手**
* 1章: 大まかに完了。

  * *肉付けと見直しが必要*
  * docutilsの詳細は ``..\appendix`` に移動?

* 2章: **完了**

検討課題
--------

1. 1章で、Sphinxの全体像を表すイメージ図が必要
2. Sphinx-users.jp_ の紹介とリンクを追加しよう
3. `進捗状況について`_ で確認したような進捗を自動的に確認する方法

議事録に補足があれば `bitbucket <https://bitbucket.org/>`_ の https://bitbucket.org/sphinxjp/sphinx-book1/issues でコメントを付けて下さい。

.. _Sphinx-users.jp: http://sphinx-users.jp/

次回予定
========

.. 日程と場所の調整が必要。以下、仮予定

  * 日時: 2013/07/07 16:00 - 18:00
  * 場所: 曙橋

調整中

表の例
======

* list-table ディレクティブ

.. list-table:: 関東の県庁所在地(人口は2004年時点)
  :header-rows: 1

  * - 県の名前
    - 県庁所在地
    - 人口(単位:千人)
  * - 茨城県
    - 水戸市
    - 2,989

.. note:: ここに注意書きを書きます。

* シンプルテーブル

============ ===========
ソフトウェア バージョン
============ ===========
gcc          4.4.7-3.el6
make         3.81-20.el6
============ ===========

* Grid Table

+--------------+-------------+
| ソフトウェア | バージョン  |
+==============+=============+
| gcc          | 4.4.7-3.el6 |
+--------------+-------------+
| make         | 3.81-20.el6 |
+--------------+-------------+

* Field List

  :gcc: 4.4.7-3.el6
  :make: 3.81-20.el6

実行コマンド
============

リテラルコードブロック::

  $ echo "Hello Sphinx"

コードブロック

.. code-block:: python



  import os
  import sys

  class Base(object):
      ...

Python 2.7インストール手順書
============================

.. toctree::


  purpose
  procedure/index
  verification
  test


* 定義リスト

reStructuredText
  Sphinxなどで利用される記法で、reSTなどとも呼ばれる。

* 画像

.. figure:: images/sphinx-log.jpg
  :scale: 50%

  Sphinxのロゴ

* test
* test2
