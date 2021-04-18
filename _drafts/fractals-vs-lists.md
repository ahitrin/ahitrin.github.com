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
Much more often you see it like this:

```
Ticket      Label                       Assignee
----        ----                        ----
#321        An original task            Fellow developer
#322        Config migrations           Fellow developer
#323        Code cleanup                Fellow developer
#324        Add more tests              Fellow developer
```

With splitting your task into subtasks, you usually have to pay a new tax: a tax of manual dependency management.
Starting from now, yours every _decision_ about task priority gains an additional cost (depending on the tracker, of course).
When you ask a question about relations between tasks, you have to visit one or several of them to find a question:

* **Is there anything that prevents us to start work on task #1**?
Well, dig into it and check whether there is any "blocker task" on a card.

* **Which tasks have no blockers**?
Visit all of them and take a look.

* **Which task has the higher priority**?
Use priorities you've assigned to them manually.
Of course, you should better ignore the fact that your "super-duper critical" task could easily be blocked by another task that looks like a "senseless crap" in isolation.

Is it possible to reduce this tax?
Let me introduce a _possible_ way to do it.

## Respect the structure

Because of the task-oriented nature of the most task-tracking tools, the relations between these tasks are second-class citizens.
How can you spot the fractal structure and efficiently work with it when the only thing you get is a big pile of tickets?
Therefore, we should take a try to visualise this tree (tree structure is also a fractal) and introduce our dependencies as first-class citizens.

Let me say right from the start: this post is not about any kind of "Gantt tool".
Yes, they provide some kind of dependency structure, but they're focused on very different things (duration, "resources", "materials", large scope) and provide very heavyweight workflow.
Here, I want to introduce the concept of lightweight planner that programmer may use in everyday work.

How a task workflow could look like in such a tool?

At the beginning of a new day you choose a single "task" from this tracker and start to work on it.
This task has already been <strike>estimated</strike> "pre-planned" and split into <strike>a simple, straightforward-looking checklist</strike> three subtasks.

![an original task as tree](/images/fractals-vs-lists/t1.png)

As it already has subtasks so you choose to start from the first one.
To improve your _focus_, you _hide_ other subtasks - they are not needed at the moment.

![focus on the first subtask](/images/fractals-vs-lists/t2.png)

At the first glance, this step appears to be simple, but when you dig into, it <strike>suddenly</strike> expectedly grows in size.
You reflect these changes in your tracker by adding new subtasks.
In your task tracker, it's a quick and easy operation.

![new nested subtasks appear](/images/fractals-vs-lists/t3.png)

A number of subtasks still grow, but you're prepared for that.
No matter how deep you dig into, you could always control the complexity of your current working context.
Split you tasks into parts, focus on a single chosen part and hide others.
Place blocking relations between subtasks when you see that they need to be executed in an order.
Remove relations when you see that they do not depend on each other.
Group similar subtasks together.
All these operations allow you to keep the number of your next actions small.

From time to time you switch from "working mode" into "planning mode".
Instead of "zooming in" into subtasks, you "zoom out" to see a whole picture.
It may looks like that, for example:

![the whole view](/images/fractals-vs-lists/t4.png)

Does it look scary?
This is quite possible when you're unfamiliar with such kind of task management.
At the first glance things seem worse: now you do not only have more subtasks to manage, but also many explicit dependencies between then.
A total amount of "items" has been increased comparing to previous approaches.

But when you look how does it behave _in dynamics_, things do change.
In that mode, you don't work on any single task.
Instead, you look on relations between them and reorganize them when needed.
It's very similar to the mind mapping technique, when you organize connections between your ideas.
You decide what is _relatively more_ important, and what is _relatively less_ important.
An every line in this graph becomes _the record of your decision_.
You don't need to keep these decisions in your mind after returning to the "close view" mode.

Back to our example, let's imagine that you decide that one of your refactoring could be performed later since it doesn't actually block your work.
(This happens to me regularly: when I dig into the code, the initial intent may be like "cleanup everything!"; but then I cool down and make a more pragmatic look, finding that some of refactorings could easily be postponed.)
To reflect your decision, you move one of your refactoring subtasks into the "Few postponed cleanups" group.

![subtask moved](/images/fractals-vs-lists/t5.png)

Then you've zoomed into the "Preliminate refactoring" again.
It's become simpler than before because the "Migrate config files" subtask doesn't block it anymore.

![zoomed back to refactoring](/images/fractals-vs-lists/t6.png)

Simply take the "top" subtask (having no blockers or nested subtasks) and solve it.
This allows new tasks to become "top" ones.
This process strictly follows the order you've defined earlier.
Now your task tracker works not like mind mapping, but like a todo list.
But it's still the same tool!

It's interesting that most of task organisation practices we use could easily be implemented using "everything is a graph" scenario:

1. **Project/Epic/Task/Subtask/Checklist/Checklist item**?
   Well, you may have as many nested levels as you wish.
   And they all could be managed the same way.
   You don't need to use any _special button_ to transform your _Checklist_ into a _Task_.
   Simply move it onto a new root.

2. **Tags/categories**?
   You could create them in a sibling project subtree and provide links between tags and tasks.

3. **Assignee**?
   The same picture: people usually form groups and formal hierarchies.

4. **Time**?
   Yes, even time could be represented as a <strike>fractal</strike> tree.
   Because time is linear, and line is a special case of a tree.
   With only few differences: "time tasks" get added and closed by themselves; they have a separate root named "far future".

![time sequence is also a simple tree](/images/fractals-vs-lists/time.png)

## Does it have drawbacks?

Of course, there are several issues.

**Tree trimming takes time**.
Almost obviuosly, when you manage many small subpieces of your task and relations between them, it requires larger part of your time.
On the flip side, detailed and flexible planning often allows to foresee and avoid traps before failing into them.
And saves the time you might lose when escaping from these traps.

**It requires skill**.
Less obvious but more important point.
Without experience in decomposition, you often don't know how to split your tasks properly.
But to gain experience, you need to do it on the regular basis.
Even after ~5 years of using my tool I still find new ideas to improve my techniques.

**Risk of context loss**.
Alas, this happens regularly.
Say you have two big subtasks of your current task (`A` and `B`).
Each one has few nested subgoals (`A.1`, `A.2`, `A.3`, `B.1`, `B.2`, and so on).
While working on subtask `A` you notice that `A.2` is a prerequisite for `B.1` and place a dependency between them.
After some time you switch from `A` to `B` and `A.2` (a blocker for `B.1`) suddenly becomes unclear for you.
Because it's described in few simple words like "Do X" which are clear in the context of `A` but not in the context of `B`.
Solution?
You need to _always_ keep some additional context together with single subtask.

**Observability issues**.
Also pretty obvious: when you have **a lot** of small subtasks, at some moment they become difficult to find.

**Risk of task duplication**.
As a consequence of two previous issues, there are duplicated subtasks that appear on a regular basis.
In other hand, this could happen to any task tracker, rigth?

All of these issues could be mitigated with a good tool.
But not the last one!

**There are no such tools**.
At least, among well known ones.
I've looked at tens (or even maybe hundreds) tools, and none of them is close enough to the described functionality.
I've even had to [create one](https://github.com/ahitrin/SiebenApp) by myself.
It allows to understand consepts described here, but still lacks a lot of important features.
But whether you only need to evaluate ideas I've described here, it may help you.

## Final thoughts

At last, we have an answer on the question from the heading.

**Why do we use linear approximations for fractals?** -- Because we don't have good tools for that.

**Why don't we have such tools?** -- Because the most of us is sticked to 

I sincerely hope that after some time we could have mature and flexible tree-based task trackers.

---
Я надеюсь, что со временем всё же появятся подобные практики и инструменты, приносящие пользу всем нам.

Замечу лишь, что мой опыт работы с Sieben дал один очень важный урок.
Практически у любой задачи можно выделить маленькую и более простую подзадачу, решение которой будет приближать вас к цели.

https://blog.jbrains.ca/permalink/remind-yourself-to-schedule-x

**N.B.**: Certified Monstrosity Manager

---

## Aknowledges

This article wouldn't appear without influence of following people:

1. [Jessica Kerr](https://twitter.com/jessitron) in her ["Code is a coastline"](https://jessitron.com/2020/09/19/code-is-a-coastline/) have inspired me to write my own thoughts about fractal nature of software tasks.
It's only my fault that it took several month to formulate the answer!
2. [Ola Ellnestam](https://twitter.com/ellnestam) and [Daniel Brolund](https://twitter.com/danielbrolund) with their ["The Mikado Method"](https://www.manning.com/books/the-mikado-method) book have changed my way of thinkning about tasks.
After several years of practicing I find it way more natural, easy and practical than the classical big-ticket-oriented approach.
3. [Sergey Tselovalnikov](https://twitter.com/SerCeMan), my Russian ex-coleague, gave me much ehough courage to start writing in English.
He's also my informal HN promoter, but it's a secret!
Check out his [blog](https://serce.me/archives/).

## Additional links

In case you want to take a look at the herd of task trackers, take a look
[here](https://opensource.com/article/21/3/open-source-project-management)
or [there](https://opensource.com/article/18/2/agile-project-management-tools).

## Comments

Sorry, comments are currently disabled here.
Once I've tried to use Disqus, but it was _a kind of mess_ that I don't want to be repeated.

But any kind of feedback is kindly appreciated!
Please leave your comments under the following tweet:

**TODO**
