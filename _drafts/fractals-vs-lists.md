---
layout: post
category : work
title: Why do we use linear approximations for fractals?
tags : [fractal trap, SiebenApp]
---
{% include JB/setup %}

**N.B.**: we need to go deeper

As a software developer, have you ever faced such situation?

You start to implement some feature in your project.
At the beginning, it looks very simple and innocent.
But as you get in, few obstacles appear.
You try to overcome them - and find new and new ones.
Suddently it appears that your simple task has grown in size for **multiple** times.

Welcome to the _fractal trap_!

You may find a good article about it
[here](https://jessitron.com/2020/09/19/code-is-a-coastline/).
**N.B.**: move to approptiate place.

Fractal traps may come from different sources: code coupling, leaky abstractions, feature interference, _and so on_.
They are almost unavoidable.
Most of developers (my guess) have to clash with them at least sometimes.

But are our **tools** really good in dealing with fractal complexity?

Imagine we have a multi-step task.
We have discovered these steps beforehand and transformed into a simple checklist.

![test](/images/1.png)

And then we start to move through this list.
Some steps appear to be simple, but other ones have suddently grown in size so they have become comparable to the parent!

![test](/images/2.png)

There might be a blocker or significant subtask for almost every simple step in your software project.

![test](/images/3.png)

And finally, you've found that changes are not covered with tests.
Much bad!

![test](/images/4.png)

How can it be represented in a, say, Github tracker?
We could apply different strategies to deal with a fractal explosion:

* keep all substeps in the same task (lack of structure/accounting)
* extract big steps into separate tasks (lack of connectivity; more manual work)
* something more?

![test](/images/5.png)

Well, sometimes it's just fine...

But there is a serious dilemma hidden in usual "linear" task manager.
In one hand, if you don't split tasks they become big and messy.
In other hand, when you split tasks it becomes too easy to lose _connections_ between tasks.
It becomes too hard to see the whole picture.
It becomes unclear when a single issue causes a bottleneck for several features.

Why is this happening?
My guess is: because most tools are task-oriented, and relations between these tasks are second-class citizens.
How can you spot the fractal structure when the only thing you get is a big pile of tickets?

(image)

Я попробовал использовать древовидный подход - посмотрите на Sieben.

Предупреждение: forever alpha, пет-проджект, очень неторопливое развитие.

Может, у вас получится лучше?

И не даёт покоя ещё один вопрос: если мы начинаем уменьшать масштаб нашего решения, не приводит ли это к тому, что мы движемся дольше?
