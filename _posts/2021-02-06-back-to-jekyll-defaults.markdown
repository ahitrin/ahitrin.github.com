---
layout: post
category : jekyll
title: Back to Jekyll defaults
tags : []
date: 2021-02-06
---

Hi there!

I've been down for few months - probably because of being overloaded of so much stuff to publish.
Fortunately, this dark period comes to its end.

But first I want to reset visual blog style.
It's become too 2012-ish.
It was hard to read, especially on mobile devices.

Just compare new (left) and old (right) styles of the same page taken from the same device.

![new and old look](/images/new-and-old.jpg)

Which one is better?

Interesting, but resetting theme to default was not so trivial.
I've tried it several times, but failed.
Jekyll has a [tool](https://jekyllrb.com/docs/migrations/) to aid migration from other publishing systems, but not from the old version from itself!
The only working way was a total "rewrite from scratch":

* Delete all old Jekyll files (`_config.yml`, `_includes`, `_layouts`, `assets` and few others)
* Copy new ones created by the `jekyll new` command
* Fix all important issues and deal with others

Now it's time to back to more interesting content.
I'll be back soon.
Please stay tuned.
