---
layout: post
category : test
title: Fractal Traps vs. Task Lists
tags : []
---
{% include JB/setup %}

As a software developer, have you ever __fall into__ such situation?

You start to implement some feature in your project.
At the beginning, it looks very simple and innocent.
But as you get in, few obstacles appear.
You try to overcome them - and find new and new ones.
Suddently it appears that your simple task has grown in size for **multiple** times.

Welcome to the fractal trap!

You may find a good article about it
[here](https://jessitron.com/2020/09/19/code-is-a-coastline/).

Fractal traps could come from different sources: code coupling, leaky abstractions, feature interference, __and so on__.
They are unavoidable.
Most of developers (my guess) have to clash with them at least sometimes.

But are we ready?
Are our **tools** ready to deal with fractal complexity?

Imagine we have a multi-step task.
We have discovered these steps beforehand and transformed into a checklist.
And then we start to move through this list.
Some steps appear to be simple, but other ones have suddently grown in size so they have become comparable to the parent!

![test](/images/1.png)

How can it be represented in a, say, Github tracker?
We could apply different strategies to deal with a fractal explosion:

* keep all substeps in the same task (lack of structure/accounting)
* extract big steps into separate tasks (lack of connectivity; more manual work)
* something more?

(images; before and after)


Размышляю, как они поддерживают рост глубины.

А что, если мы пытаемся решить задачу типа mikado method?

Сколько уровней вложенности будет там?

Частично помогают ссылки между задачами, но они лишают возможности видеть цельную картину.

Есть Gantt-диаграммы, но они пугают всех, кроме менеджеров :)

Я попробовал использовать древовидный подход - посмотрите на Sieben.

Предупреждение: forever alpha, пет-проджект, очень неторопливое развитие.

Может, у вас получится лучше?

И не даёт покоя ещё один вопрос: если мы начинаем уменьшать масштаб нашего решения, не приводит ли это к тому, что мы движемся дольше?
