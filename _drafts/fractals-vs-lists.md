---
layout: post
category : work
title: Why do we use linear approximations for fractals?
tags : [fractal trap, SiebenApp]
---

As a software developer, have you ever faced such a situation?

You start to implement some feature in your project.
At the beginning, it looks very simple and innocent.
Soon, as you get in, few obstacles appear.
You try to overcome them - and find new and new ones!
Suddenly it appears that your simple task has grown in size for **multiple** times.

## Welcome to the _fractal trap_!

Let's explore an imaginary (but quite typical) situation.
Say you have a "software project": a big pile of code, and some kind of "task tracker" used to plan a work upon this code.
At the beginning of a new week you choose a single "task" from this tracker and start to work on it.
This task has already been "estimated" and split into a simple, straightforward-looking checklist.

![An original task](/images/fractals-vs-lists/1.png)

Then you simply start to move through this list.
At the first glance, these steps appear to be simple, but when you dig into the first one, it suddenly grows in size.

![An original task becomes a little bigger](/images/fractals-vs-lists/2.png)

There might be a _blocker_ or significant subtask for almost every simple step in your software project.
Your "first subtask" grows more and more, becoming comparable in size to the whole original task.

![An original task has grown 2x in size](/images/fractals-vs-lists/3.png)

Finally, you've found that code needed to be changed is not covered with tests.
Much bad, need to fix it!

![We're in the fractal trap!](/images/fractals-vs-lists/4.png)

Of course, it's not a rant against refactoring or tests!
They are truly needed, especially in complex and aged codebases.
I rant against the way we've used to deal with tasks.

![Sierpinski triangle](/images/fractals-vs-lists/Sierpinski_triangle.svg)

<small>Sierpiński triangle, image from [Wikipedia](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle)</small>

Like a [fractal](https://en.wikipedia.org/wiki/Fractal), a software development task could easily hide few another subtasks with comparable size and/or complexity.
They could be invisible to you until you face them.
That's why I call this "a trap".
Fractal traps usually come from different sources: code coupling, leaky abstractions, requirements shift, and so on.
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

Once you got tired of big tasks, you start to split it into pieces.
In your new working process, each subtask is allowed to become a full-pledged task in your tracker once you notice it's big enough.
Like this:

![4 tasks instead of 1](/images/fractals-vs-lists/5.png)

Oh, wait!..

Actually, you'll usually see it like this:

```
Ticket      Label                       Assignee
----        ----                        ----
#1          An original task            Fellow developer
#2          Config migrations           Fellow developer
#3          Code cleanup                Fellow developer
#4          Add more tests              Fellow developer
```

With splitting your task into subtasks, you usually have to pay a new tax: a tax of manual dependency management.
Starting from now, yours every _decision_ about task priority gains an additional cost (depending on the tracker, of course).
When you ask a question about relations between tasks, you have to visit one or several of them to find a question:

* **Is there anything that prevents us to start work on task #1**?
Well, dig into it and check whether there is any "blocker task" on a card.

* **Which tasks have no blockers**?
Visit all of them and take a look.

* **Which task has the higher priority**?
Use priorities ("senseless crap"/"normal task"/"critical"/"super-duper critical"/"needed yesterday") you've assigned to them manually.
Of course, you should better ignore the fact that your "super-duper critical" task could easily be blocked by another task that in isolation looks like a "senseless crap".

Is it possible to reduce this tax?
Let me introduce a _possible_ way to do it.

## Respect the structure

Because most tools are task-oriented, and relations between these tasks are second-class citizens.
How can you spot the fractal structure and efficiently work with it when the only thing you get is a big pile of tickets?
Therefore, we should take a try to visualise this tree (tree structure is also a fractal) and make our dependencies a first-class citizens.

How a task workflow could look like in such a tool?

At the beginning of a new week you choose a single "task" from this tracker and start to work on it.
This task has already been <strike>estimated</strike> "pre-planned" and split into <strike>a simple, straightforward-looking checklist</strike> three subtasks.

![an original task as tree](/images/fractals-vs-lists/t1.png)

As it already has subtasks so you choose to start from the first one.
To improve your _focus_, you _hide_ other subtasks - they are not needed at the moment.

![focus on the first subtask](/images/fractals-vs-lists/t2.png)

At the first glance, this step appears to be simple, but when you dig into, it suddenly grows in size.
You reflect these changes in your tracker.

![new nested subtasks appear](/images/fractals-vs-lists/t3.png)

A number of subtasks still grow, but now you're prepared for that.
No matter how deep you dig into, you could always control the complexity of your current context.
Split you tasks into parts, focus on a single chosen part and hide others.
Place blocking relations between subtasks when you see that they need to be executed in an order.
Remove relations when you see that they do not depend on each other.
Group similar subtasks together.
And so on...

From time to time you switch from "working mode" into "planning mode".
Instead of "zooming in" into subtasks, you "zoom out" to see a whole picture.
It may looks like that, for example:

![the whole view](/images/fractals-vs-lists/t4.png)

Does it look scary?
This is quite possible when you're unfamiliar with such kind of task management.
At the first glance things seem worse: now you do not only have more subtasks to manage, but also many explicit dependencies between then.
A total amount of "items" has been increased comparing to previous approaches.

But when you look how does it behave _in dynamics_, things do change.
In that mode, you don't work on any task.
Instead, you look on relations between them and reorganize them when needed.
It's very similar to the mind mapping technique, when you organize connections between your ideas.
You decide what is relatively more important, and what is relatively less important.
An every line in this graph becomes _the record of your decision_.
You don't need to keep these decisions in your mind after returning to the "close view" mode.

Back to our example, let's imagine that you decide that one of your refactoring could be performed later since it doesn't actually block your work.
(This happens to me sometimes: when I dig into the code, the initial intent may be like "cleanup everything!"; but then I cool down and make a more pragmatic look, finding that some of refactorings could easily be postponed.)
To reflect your decision, you move one of your refactoring subtasks into the "Few postponed cleanups" group.

![subtask moved](/images/fractals-vs-lists/t5.png)

Then you've zoomed into the "Preliminate refactoring" again.
It's become simpler than before because the "Migrate config files" subtask doesn't block it anymore.

![zoomed back to refactoring](/images/fractals-vs-lists/t6.png)

Simply take the "top" subtask (having no blockers or nested subtasks) and solve it.
This allows new tasks to become "top" ones.
This process strictly follows the order you've defined earlier.
Now your task tracker works not like mind mapping, but like a todo list!

---
* Отлично сочетается с trunk-based-development
* Задачи и куски должны быть видны всей команде
* Разбиение задачи на куски - тривиальная операция, которая делается часто
* Становится гораздо проще управляться со всякими TODO.
Не нужно раскидывать их в коде или где-то ещё.
Делаем подзадачу "do later" и фигачим идеи туда.
Потом, когда сделаем текучку, можно к ним вернуться
* Как результат, работать легче и приятнее

Но есть и минусы

1. Требуется дисциплина и умение.
Они частично вырабатываются в процессе, но я до сих пор на некоторых задачах думаю "обойдусь-ка решением по старинке, а то непонятно, как это дело разложить, или просто лень".
Потом часто жалею, впрочем.

2. Такой детальный менеджмент требует определённого времени.
Элементов стало больше, причём существенно.

3. Нет по-настоящему подходящих инструментов.
Известные мне примеры не дотягивают.

Я надеюсь, что со временем всё же появятся подобные практики и инструменты, приносящие пользу всем нам.

Замечу лишь, что мой опыт работы с Sieben дал один очень важный урок.
Практически у любой задачи можно выделить маленькую и более простую подзадачу, решение которой будет приближать вас к цели.

https://blog.jbrains.ca/permalink/remind-yourself-to-schedule-x

Порой большая задача выглядит слишком сложной, непонятной, запутанной - но откусывая от неё один маленький кусочек за другим, мы в какой-то момент можем превратить её в простую и подъёмную.
И если инструмент для управления задачами помогает применять такой подход, это очень круто.

**N.B.**: Certified Monstrosity Manager

Если трекаем не только задачи, но ещё добавляем подцели и связи между ними, количество объектов может быстро выйти из-под контроля.
Чтобы этого не происходило, **инструмент** должен предоставлять богатые возможности для _task herding_.
Тогда по факту задач в зоне внимания будет даже меньше, чем если мы работаем со списком.


different Gantt tools:
https://habr.com/ru/company/macloud/blog/548940/

---

## Aknowledges

This article wouldn't appear without influence of following people:

1. [Jessica Kerr](https://twitter.com/jessitron) in her ["Code is a coastline"](https://jessitron.com/2020/09/19/code-is-a-coastline/) have inspired me to write my own thoughts about fractal nature of software tasks.
2. [Ola Ellnestam](https://twitter.com/ellnestam) and [Daniel Brolund](https://twitter.com/danielbrolund) with their ["The Mikado Method"](https://www.manning.com/books/the-mikado-method) book have changed my way of thinkning about tasks.
After several years of practicing I find it way more natural, easy and practical than the classical big-ticket-oriented approach.
3. [Sergey Tselovalnikov](https://twitter.com/SerCeMan), my Russian ex-coleague, gave me much ehough courage to write in English.
Check out his [blog](https://serce.me/archives/).

## Comments

Sorry, comments are currently disabled here.
Once I've tried to use Disqus, but it was _a kind of mess_ that I don't want to be repeated.

But any kind of feedback is kindly appreciated!
Please leave your comments under the following tweet:

**TODO**
