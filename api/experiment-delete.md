---
layout: page
title:  Experiment Delete
lead:   Delete an experiment.
---

## Request Format

{% highlight http %}
DELETE /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa HTTP/1.1
Host: api.mynaweb.com
{% endhighlight %}

## Response Format

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{ "typename": "ok" }
{% endhighlight %}
