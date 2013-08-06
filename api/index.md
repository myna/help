---
layout: page
title: The REST API
lead: Myna's REST API allows you to connect any client that can make a HTTP request
---

The goal of Myna's API is simple: if you can think of an experiment, you should be able to code it against our API. To this end, the API has a very flexible model of interaction:

- Clients obtain the current state of an experiment. This includes weights on the variants, representing Myna's suggestion of the proportions in which the variants should be displayed. Clients can use these weights to make one or more suggestions, or combine the weights with other rules to choose variants to display

- Client notify Myna about variants that were displayed and rewards that were received. This data can sent back as it happens, or in a batched up if, for example, the client is offline. It is largely up to client to ensure that this data makes sense -- for example, that there are not more conversions than views.


## URLs

All API actions are performed by accessing URLs of the form

{% highlight bash %}
http://api.mynaweb.com/v2/action/
{% endhighlight %}

For example, the following URL will get the current state of an experiment:

{% highlight bash %}
http://api.mynaweb.com/v2/experiment/45923780-80ed-47c6-aa46-15e2ae7a0e8c
{% endhighlight %}


## Request and Response Format

All endpoints accept and return JSON, with the exception of a few special cases designed for use from a web browser.


## Securing Your Connection

Myna's API is available over both secure (HTTPS) and unsecure connections. You should use SSL encrypted requests for all calls that require [authentication](authentication.html). For other calls use whichever is more convenient. In particular, cross-domain requests from a web browser should match the protocol (HTTP or HTTPS) used by the page the browser is displaying to avoid security warnings.
