---
layout: page
title:  Experiment Reset
lead:   Reset the view and reward counts of an experiment to zero.
---

## Request Format

This is a POST endpoint to indicate that it is not idempotent. However, the body is currently ignored.

{% highlight http %}
POST /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/reset HTTP/1.1
Content-Type: application/json
Content-Length: 2

{}
{% endhighlight %}

## Response Format

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  // Experiment info in the same format as the "experiment read" endpoint...
}
{% endhighlight %}