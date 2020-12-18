---
layout: post
category : work
comments : true
tags : [java, ServerAccess, static analysis]
---

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

**UDP**: а вот ещё что обнаружилось...

Оказывается, что, в отличие от других средств анализа (FindBugs, PMD,..) у infer есть интересный режим работы: показ целого трейса, где происходит утечка.
Это что-то новенькое!

{% highlight bash %}
ahitrin@ahitrin:~/projects/ServerAccess$ ~/opt/infer-linux64-v0.1.0/infer/infer/bin/inferTraceBugs --select 4 --max-level max
/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:34: error: RESOURCE_LEAK
   resource acquired by call to FileWriter(...) at line 32 is not released after line 34

Showing all 5 steps of the trace

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:29: start of procedure write(...)
27   public class FileUtils
28   {
29 >     public static void write(File file, String contents) throws IOException
30       {
31           file.createNewFile();

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:31:
29       public static void write(File file, String contents) throws IOException
30       {
31 >         file.createNewFile();
32           PrintWriter writer = new PrintWriter(new FileWriter(file));
33           writer.print(contents);

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:32:
30       {
31           file.createNewFile();
32 >         PrintWriter writer = new PrintWriter(new FileWriter(file));
33           writer.print(contents);
34           writer.flush();

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:33:
31           file.createNewFile();
32           PrintWriter writer = new PrintWriter(new FileWriter(file));
33 >         writer.print(contents);
34           writer.flush();
35       }

/home/ahitrin/projects/ServerAccess/src/test/java/ru/naumen/servacc/test/settings/FileUtils.java:34:
32           PrintWriter writer = new PrintWriter(new FileWriter(file));
33           writer.print(contents);
34 >         writer.flush();
35       }
36
{% endhighlight %}

Безусловно, проект ещё сырой (на большом рабочем проекте он позорно помер), но приёмчики работы у него интересные.
Глядишь, что-то полезное и вырастет в итоге.
