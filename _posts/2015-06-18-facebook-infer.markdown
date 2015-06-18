---
layout: post
category : work
comments : true
tags : [java, ServerAccess, static analysis]
---
{% include JB/setup %}

На днях Facebook выпустил [новую утилиту](http://fbinfer.com/) для статического анализа кода на Java/C.
Не смог пройти мимо, решил натравить его на [ServerAccess](https://github.com/apatrushev/ServerAccess).

В целом, делается это довольно тривиально: качаем, запускаем...

{% highlight bash %}
ahitrin@ahitrin:~/projects/ServerAccess$ ./gradlew clean
:clean

BUILD SUCCESSFUL

Total time: 2.756 secs
{% endhighlight %}

Если не сделать `clean`, то ленивый Gradle ничего не будет компилировать, и Infer не найдёт никаких ошибок.
А после очистки сразу что-то нашёл!

{% highlight bash %}
ahitrin@ahitrin:~/projects/ServerAccess$ ~/opt/infer-linux64-v0.1.0/infer/infer/bin/infer -- ./gradlew build
Starting analysis (Infer version v0.1.0)
Analysis done

77 files analyzed


/home/ahitrin/projects/ServerAccess/src/main/java/ru/naumen/servacc/HTTPProxy.java:96: error: RESOURCE_LEAK
   resource acquired by call to accept() at line 95 is not released after line 96

/home/ahitrin/projects/ServerAccess/src/main/java/ru/naumen/servacc/HTTPProxy.java:99: error: RESOURCE_LEAK
   resource acquired by call to ServerSocket(...) at line 92 is not released after line 99

/home/ahitrin/projects/ServerAccess/src/main/java/ru/naumen/servacc/settings/PropertiesFile.java:56: error: RESOURCE_LEAK
   resource acquired by call to FileOutputStream(...) at line 52 is not released after line 56

/home/ahitrin/projects/ServerAccess/src/main/java/ru/naumen/servacc/settings/PropertiesFile.java:60: error: RESOURCE_LEAK
   resource acquired by call to FileOutputStream(...) at line 52 is not released after line 60

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:34: error: RESOURCE_LEAK
   resource acquired by call to FileWriter(...) at line 32 is not released after line 34

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:46: error: RESOURCE_LEAK
   resource acquired by call to FileReader(...) at line 40 is not released after line 46
{% endhighlight %}

Завёл [баг](https://github.com/apatrushev/ServerAccess/issues/58), буду на досуге копаться.

Что бы ещё теперь проверить?
