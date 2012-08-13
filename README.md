GGM ( [Goliath](https://github.com/postrank-labs/goliath) + [Grape](https://github.com/intridea/grape) + [MongoDB](http://www.mongodb.org/), on [Heroku](http://ggm.herokuapp.com/v1/categories) )
===

This is a GitWatcher lab, experimenting with Goliath asyncronous ruby web server framework, Grape APIs, [gitwatcher.com](http://gitwatcher.com) data on MongoLAB/MongoDB and Heroku PAAS.
Here they are, the Heroku working examples used during the tests: 

-    [http://ggm.herokuapp.com/v1/categories](http://ggm.herokuapp.com/v1/categories)	 
-    [http://gitwatcher.com/categories.json](http://gitwatcher.com/categories.json)

ApacheBench (ab): 
===

>[ab](http://en.wikipedia.org/wiki/ApacheBench) is a single-threaded command line computer program for measuring the performance of HTTP web servers. Originally designed to test the Apache HTTP Server, it is actually generic enough to test any web server.

Following the comparison between [Rails 3](https://github.com/rails/rails) and [Goliath 1](https://github.com/postrank-labs/goliath) JSON API.

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

Here it is banchmark of Goliath, on a local Ubuntu 12.04 LTS machine, whith ruby 1.9.3p194 (2012-04-20 revision 35410) [i686-linux] :  

<pre>
lsoave@ubuntu:~/rails/tests/GGM$ ab -n 1000 -c 1000 http://localhost:5000/v1/categories
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests


Server Software:        Goliath
Server Hostname:        localhost
Server Port:            5000

Document Path:          /v1/categories
Document Length:        5113 bytes

Concurrency Level:      1000
Time taken for tests:   9.160 seconds
Complete requests:      1000
Failed requests:        0
Write errors:           0
Total transferred:      5240000 bytes
HTML transferred:       5113000 bytes
Requests per second:    109.17 [#/sec] (mean)
Time per request:       9159.632 [ms] (mean)
Time per request:       9.160 [ms] (mean, across all concurrent requests)
Transfer rate:          558.67 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       14   21   4.3     21      31
Processing:  4342 7274 1436.6   7662    9115
Waiting:     4341 7273 1436.7   7661    9115
Total:       4372 7295 1432.4   7682    9129

Percentage of the requests served within a certain time (ms)
  50%   7682
  66%   8363
  75%   8538
  80%   8738
  90%   8973
  95%   9084
  98%   9129
  99%   9129
 100%   9129 (longest request)
lsoave@ubuntu:~/rails/tests/GGM$
</pre>

the banchmark of Rails on the same machine get back an apr_poll timeout (70007). That happen serverving Rails both with thin or webrik:

<pre>
lsoave@ubuntu:~/rails/github/gitwatcher$ ab -k -n 1000 -c 1000 http://localhost:3001/categories.json
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
apr_poll: The timeout specified has expired (70007)
lsoave@ubuntu:~/rails/github/gitwatcher$
</pre>

