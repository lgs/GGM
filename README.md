GGM
===

GitWatcher lab experimenting with Goliath reactor, Grape APIs, [gitwatcher.com](http://gitwatcher.com) data on MongoDB and Heroku PAAS

ApacheBench (ab)
===
>[ab](http://en.wikipedia.org/wiki/ApacheBench) is a single-threaded command line computer program for measuring the performance of HTTP web servers. Originally designed to test the Apache HTTP Server, it is actually generic enough to test any web server.

The following ApacheBench, has been run on Heroku Cedar single Web Dynos:

`
lsoave@ubuntu:~$ ab -n 100 -c 100 http://ggm.herokuapp.com/v1/categories
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking ggm.herokuapp.com (be patient).....done

Server Software:        Goliath
Server Hostname:        ggm.herokuapp.com
Server Port:            80

Document Path:          /v1/categories
Document Length:        5113 bytes

Concurrency Level:      100
Time taken for tests:   1.826 seconds
Complete requests:      100
Failed requests:        0
Write errors:           0
Total transferred:      525900 bytes
HTML transferred:       511300 bytes
Requests per second:    54.76 [#/sec] (mean)
Time per request:       1826.136 [ms] (mean)
Time per request:       18.261 [ms] (mean, across all concurrent requests)
Transfer rate:          281.24 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:      106  143  19.4    144     201
Processing:   160  566 232.7    496    1088
Waiting:      123  368 201.6    299     822
Total:        343  710 237.6    653    1220

Percentage of the requests served within a certain time (ms)
  50%    653
  66%    695
  75%    713
  80%   1022
  90%   1168
  95%   1191
  98%   1216
  99%   1220
 100%   1220 (longest request)
lsoave@ubuntu:~$ 
`


