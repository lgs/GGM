GGM ( Goliath - Grape - MongoDB, on Heroku )
===

This is a GitWatcher lab, experimenting with Goliath asyncronous ruby web server framework, Grape APIs, [gitwatcher.com](http://gitwatcher.com) data on MongoLAB/MongoDB and Heroku PAAS.
Here they are, the Heroku working examples used during the tests: 
-    [http://ggm.herokuapp.com/v1/categories](http://ggm.herokuapp.com/v1/categories)	 
-    [http://gitwatcher.com/categories.json](http://gitwatcher.com/categories.json)

ApacheBench (ab): 
===

>[ab](http://en.wikipedia.org/wiki/ApacheBench) is a single-threaded command line computer program for measuring the performance of HTTP web servers. Originally designed to test the Apache HTTP Server, it is actually generic enough to test any web server.

What is following is a comparison between [Rails 3](https://github.com/rails/rails) and [Goliath 1](https://github.com/postrank-labs/goliath) JSON API consuming
---
The following ApacheBench, has been run on Heroku Cedar single Web Dynos, on Ruby 1.9.3p194, MongoLAB/MongoDB. Goliath 1 responds to 100 cuncurrent calls in 1.826 seconds, with a medium of 54.76 requests per second:

<pre>
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
</pre>

Testing the same JSON API served by Rails 3 on Heroku Cedar single Web Dynos, Ruby 1.9.3p194 and MongoLab/mongodb, gives back a slower responceof 100 cuncurrent calls in 60.315 seconds,  with a medium of 1.66 requests per second :

<pre>
lsoave@ubuntu:~$ ab -k -n 100 -c 100 http://gitwatcher.com/categories.json
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking gitwatcher.com (be patient).....done


Server Software:        nginx
Server Hostname:        gitwatcher.com
Server Port:            80

Document Path:          /categories.json
Document Length:        601 bytes

Concurrency Level:      100
Time taken for tests:   60.315 seconds
Complete requests:      100
Failed requests:        38
   (Connect: 0, Receive: 0, Length: 38, Exceptions: 0)
Write errors:           0
Non-2xx responses:      62
Keep-Alive requests:    62
Total transferred:      48515 bytes
HTML transferred:       37262 bytes
Requests per second:    1.66 [#/sec] (mean)
Time per request:       60315.259 [ms] (mean)
Time per request:       603.153 [ms] (mean, across all concurrent requests)
Transfer rate:          0.79 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  199 346.3    119    1129
Processing:  4982 27726 21186.7  30152   60176
Waiting:    30145 37315 12659.7  30167   60176
Total:       4982 27925 21395.6  30269   60312

Percentage of the requests served within a certain time (ms)
  50%  30269
  66%  30312
  75%  31272
  80%  60252
  90%  60283
  95%  60298
  98%  60310
  99%  60312
 100%  60312 (longest request)
lsoave@ubuntu:~$ 
</pre>




