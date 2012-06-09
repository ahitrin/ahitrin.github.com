---
layout: page
title: Division Main Subroutine
---
{% include JB/setup %}

Меня зовут Андрей Хитрин.

Где меня можно найти:

- [Twitter](https://twitter.com/ahitrin)
- [GitHub](https://github.com/ahitrin)
- [Habrahabr](http://habrahabr.ru/users/zloddey/)
- [Facebook](https://www.facebook.com/andrey.hitrin)
- [vk.com](http://vk.com/andrey.hitrin)
- [LinkedIn](http://www.linkedin.com/in/andreyhitrin)
- [Мой Круг](http://andrey-a-hitrin.moikrug.ru/)

### Список записей

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

