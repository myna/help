---
layout: page
title: Error Handling
lead: Myna handles errors in a consistent manner, making handling errors easy.
---

Myna handles errors in keeping with REST principles. Errors are reported with HTTP status codes in the 400 (for client errors) or 500 (for server errors) range. The response will contain a JSON object describing the error. This applies to all endpoint except those that are intended to be use from a web browser. When an endpoint is intended to be called from a browser it will return a 200 status code on error. This is because the browser will swallow any responses with a different status code, meaning that your code will never have a change to process them.

## Error Format

{% highlight bash %}
$ curl 'http://api.mynaweb.com/v2/experiment/abcde'
{
  "typename":  "problem",
  "timestamp": "2013-08-06T15:59:33.232Z",
  "status":    403,
  "messages":  [{
    "typename": "authentication",
    "message":" You must provide user credentials.",
    "data":     {"credentials":"anonymous"}
    }]
}
{% endhighlight %}
