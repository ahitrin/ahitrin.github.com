---
title: "MindMapping в графовых базах данных"
layout: post
category : misc
comments : true
tags : [mindmap, neo4j, ServerAccess]
date: 2014-06-01
---

В голове уже очень долго созревала одна идея, и вчера она наконец-то материализовалась в своего рода озарение.

Наверняка многие знакомы с концепцией Mind Mapping'а (не перевожу, потому что устоявшийся перевод мне не по душе).
Я тоже давно и с удовольствием использую эту методику, когда мне нужно проанализировать сложный вопрос.

Однако существующие инструменты (например, [Freemind](http://freemind.sourceforge.net/wiki/index.php/Main_Page), [XMind](http://www.xmind.net/), [mindmup](http://www.mindmup.com/)), хоть и хороши, оставляют желать лучшего в некоторых случаях.
Например, порой хочется довольно странных вещей: вводить разные категории для узлов, разные категории для связей, фильтровать их по различным условиям, добавлять развёрнутые описания и т.п.
Существующие инструменты этого, как правило, не позволяют (либо позволяют, но не дают желаемой гибкости и удобства).

Но стойте, у нас же есть _целый класс_ инструментов, которые предназначены именно для того, чтобы хранить самые разнообразные графы любых форм и цветов!
Имя им - "графовые базы данных".
Что будет, если мы возьмём такую базу данных и начнём строить наш mind map в ней?
Вот я вчера и решил это попробовать.

Чтобы не ходить далеко, взял первую же БД, про которую вспомнил: [Neo4J](http://www.neo4j.org/).
В качестве рабочего примера решил расписать схему проблем, с которыми я сталкиваюсь при работе над [ServerAccess](https://github.com/apatrushev/ServerAccess).
В этом проекте большое количество унаследованного, тесно связанного кода, и при добавлении новых фич значительную часть времени приходится тратить просто на то, чтобы не превратить код в свалку костылей.
Есть хороший метод ([Mikado Method](http://mikadomethod.org/)), позволяющий разбирать такие кучи, но он требует аккуратного составления карты проблем.
Так что, я решил убить сразу несколько зайцев: и опробовать Neo4J в деле, и составить схему проблем SA.

Пока что дело движется совсем потихоньку.
Изучаю язык запросов [Cypher](http://www.neo4j.org/learn/cypher), вырабатываю в голове правила для моей схемы, делаю первые наброски базы.

![pic](/images/graph-db-mindmapping/scheme.jpg)

Однако, некоторые интересные выводы можно сделать уже сейчас.

Первое чёткое впечатление: скорость работы пользователя через СУБД **заметно ниже**, чем в специализированных инструментах для MindMapping'а.
Это вызвано тем, что для заведения узла требуется набить руками кусок кода приличного размера, а не просто лупцануть по Enter.
Думаю, даже когда у меня будет больше опыта в Cypher, скорость работы вряд ли достигнет сравнимых показателей.
Поэтому для простых и _быстрых_ карт графовая БД однозначно не подходит, и следует без колебаний выбирать специализированный инструмент.

Тем не менее, возможности БД по работе с графами внушают оптимизм.
Чувствуется, что база данных не ограничивает тебя, а, наоборот, позволяет настроить себя под твои нужды максимально точным образом.
Можно ввести произвольные "типы" для узлов (в Neo4J это называется Labels), добавлять им произвольные свойства, создавать между ними связи разных типов (и тоже со своими свойствами), превращать свойства в новые узлы, превращать узлы в свойства, фильтровать сущности произвольным образом...

Веб-интерфейс Neo4J - это вообще шедевр, который заслуживает отдельной похвалы.
Пожалуй, стоило поставить себе эту СУБД, чтобы хотя бы поглядеть, как следует работать с современным вебом.
Совершенно не ожидал такого изящества от "обычной базы данных".

Впрочем, посмотрим, как дело пойдёт дальше.
Справится ли Neo4J с моими потребностями, и справлюсь ли я сам с Neo4J.
Будет ли удобно поддерживать и развивать базу данных по мере её роста.
Хватит в работе ли веб-морды, или потребуется создавать собственные дополнительные инструменты.
Поживём - увидим!
