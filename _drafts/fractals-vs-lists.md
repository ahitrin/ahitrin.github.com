---
layout: post
category : work
title: Why do we use linear approximations for fractals?
tags : [fractal trap, SiebenApp]
---

As a software developer, have you ever faced such a situation?
I bet you have.

You start to implement some feature in your project.
At the beginning, it looks very simple and innocent.
Soon, as you get in, few obstacles appear.
You try to overcome them - and find new and new ones!
Suddenly it appears that your simple task has grown in size for **multiple** times.

## Welcome to the _fractal trap_!

Let's explore an imaginary (but quite typical) situation.
Say you have a "software project": a big pile of code, and some kind of "task tracker" used to plan a work upon this code.
At the beginning of a new week you choose a single "task" from this tracker and start to work on it.
This task has already been estimated and split into a simple, straightforward-looking checklist.

![test](/images/fractals-vs-lists/1.png)

Then you simply start to move through this list.
At the first glance, these steps appear to be simple, but when you dig into the first one, it suddenly grows in size.

![test](/images/fractals-vs-lists/2.png)

There might be a _blocker_ or significant subtask for almost every simple step in your software project.
Your "first subtask" grows more and more, becoming comparable in size to the whole original task.

![test](/images/fractals-vs-lists/3.png)

Finally, you've found that code needed to be changed is not covered with tests.
Much bad, need to fix it!

![test](/images/fractals-vs-lists/4.png)

Of course, it's not a rant against refactoring or tests!
They are truly needed, especially in complex and aged codebases.
I rant against the way we've used to deal with tasks.

![sierpinski triangle](/images/fractals-vs-lists/Sierpinski_triangle.svg)

<small>Sierpiński triangle, image from [Wikipedia](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle)</small>

**TODO**: define "fractal trap" term

Fractal traps usually come from different sources: code coupling, leaky abstractions, and so on.
They are almost unavoidable.
I think it wouldn't be wrong to claim that the most developers have to clash with them at least sometimes.
But how do we usually deal with such a kind of problem?

## A classical approach

The most naive approach to handle this problem is a simple ignorance.
Each task is growing in size?
Ok, let's deal with it.
Just keep it going until the final goal is achieved.

Alas, by keeping all substeps in the same task we make them quite opaque.
_Something_ is happening in the task, and it will be finished _someday_.

Is it fine or not, strongly depends on your working environment and team agreements.
For example, let's imagine that your project have a strict delivering policy.
You have to deliver all your code at once, because of rigid "task lifecycle".
This means you have to roll it out only after having done the last substep.
How long your feedback cycle will become?
How many code conflicts you'll have to resolve during the merge?

Also, you should mind the cognitive load!
The bigger is your task, the more nuances you have to keep in your head.
Actual consequences of your changes, potential consequences, potential compatibility breaks, questions you're unsure about, and so on.

Of course, this typical problem has very typical solution.
Let's proceed to it.

## Divide and conquer

**TODO**: work here

Extract big steps into separate tasks (lack of connectivity; more manual work)

![test](/images/fractals-vs-lists/5.png)

But there is a serious dilemma hidden in usual "linear" task manager.
In one hand, if you don't split tasks they become big and messy.
In other hand, when you split tasks it becomes too easy to lose _connections_ between tasks.
It becomes too hard to see the whole picture.
It becomes unclear when a single issue causes a bottleneck for several features.

**NB**: Trunk-based development

## Respect the structure

Because most tools are task-oriented, and relations between these tasks are second-class citizens.
How can you spot the fractal structure when the only thing you get is a big pile of tickets?

![test](/images/fractals-vs-lists/6.png)

## New approach?

Я попробовал использовать древовидный подход - посмотрите на Sieben.

Предупреждение: forever alpha, пет-проджект, очень неторопливое развитие.

Может, у вас получится лучше?

И не даёт покоя ещё один вопрос: если мы начинаем уменьшать масштаб нашего решения, не приводит ли это к тому, что мы движемся дольше?

Если упарываться ещё сильнее, то можно прийти к диаграммам гантта или CCPM.
Но необязательно заходить настолько далеко.
Это путешествие не для всех.

Замечу лишь, что мой опыт работы с Sieben дал один очень важный урок.
Практически у любой задачи можно выделить маленькую и более простую подзадачу, решение которой будет приближать вас к цели.
Порой большая задача выглядит слишком сложной, непонятной, запутанной - но откусывая от неё один маленький кусочек за другим, мы в какой-то момент можем превратить её в простую и подъёмную.
И если инструмент для управления задачами помогает применять такой подход, это очень круто.

## Aknowledges

This article wouldn't appear without influence of following people:

1. [Jessica Kerr](https://twitter.com/jessitron) in her ["Code is a coastline"](https://jessitron.com/2020/09/19/code-is-a-coastline/) have inspired me to write own thoughts about fractal nature of software tasks.
2. [Ola Ellnestam](https://twitter.com/ellnestam) and [Daniel Brolund](https://twitter.com/danielbrolund) with their ["The Mikado Method"](https://www.manning.com/books/the-mikado-method) book have changed my way of thinkning about tasks.
After several years of practicing I find it way more natural, easy and practical than the classical big-ticket-oriented approach.
3. [Sergey Tslovalnikov](https://twitter.com/SerCeMan), my Russian ex-coleague, gave me much ehough courage to write in English.
Check out his [blog](https://serce.me/archives/).

## Comments

Sorry, comments are currently disabled here.
Once I've tried to use Disqus, but it was _a kind of mess_ that I don't want to be repeated.

But any kind of feedback is kindly appreciated!
Please leave your comments under the following tweet:

**TODO**
