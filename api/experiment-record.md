---
layout: page
title:  Experiment Record
lead:   "Record new user activity: page views and conversions."
---

## Request Format

The main variant of this endpoint uses the `POST` verb. The `events` key is used to
report page views and conversions. It is an array of recent events from the target
web site or mobile app.

{% highlight http %}
POST /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/record HTTP/1.1
Host: api.mynaweb.com
Content-Type: application/json
Content-Length: <length>

{
  "events": [
    { "typename": "view", "variant": "variant1", "timestamp": 12345 },
    { "typename": "reward", "variant": "variant1", "amount": 1.0, "timestamp": 12345 }
  ]
}
{% endhighlight %}

## Response Format

Returns the same result as the [experiment read](experiment-read.html) endpoint.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  // Same format result as the "read experiment" endpoint...
}
{% endhighlight %}

## API Keys and Summary Responses

When an API key is used to access the endpoint, certain fields are omitted to avoid leaking sensitive customer data.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  // Same summary result as the "read experiment" endpoint...
}
{% endhighlight %}

## JSONP

A GET variant of the endpoint makes it easier to upload information about a single view or reward using JSONP. This endpoint accepts several URL parameters:

- The `typename` parameter must be one of `view` or `reward`, specifying the type of information included in the request.
- The `variant` parameter gives the ID of the variant that is affected.
- The `reward` parameter, if present, specifies the reward the variant receives.
- The `apikey` parameter gives the API key used to authorise the action.
- If a `callback` parameter is provided, the JSON response is wrapped in a call to the callback function. Otherwise the response is plain JSON.

{% highlight http %}
GET /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/record?variant=variant1&amount=1.0&callback=myCallback&typename=reward&apikey=bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb HTTP/1.1
{% endhighlight %}

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/javascript
Content-Length: <length>

myCallback({
  // Same result format as the "read experiment" endpoint...
});
{% endhighlight %}
