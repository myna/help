---
layout: page
title: Error Handling
lead: Myna handles errors in a consistent manner, making handling errors easy.
---

Myna handles errors in keeping with REST principles. Errors are reported with HTTP status codes in the 400 (for client errors) or 500 (for server errors) range. The response will contain a JSON object describing the error.

## Error Format

Error responses always follow a set format:

 - `typename` - always `"problem"`;
 - `timestamp` - ISO8601 timestamp of the error (always GMT);
 - `status` - the HTTP status code (useful in JSONP responses - see below);
 - `messages` - an array of error messages.

The format of the items in the `messages` array varies from error to error, but the following fields usually carry standard meanings:

 - `typename` - a machine-readable error category;
 - `message` - a human-readable rescription of what went wrong;
 - `path` - if the error is associated with a field in a request or database entry,
   a Javascript-style *path* to the field is supplied (e.g. `"user.name"` or `"experiment.settings.settingName"`);
 - `data` - an error-message-specific hash of extra information.

An example error response follows:

{% highlight json %}
{
  "typename": "problem",
  "timestamp": "2013-08-06T15:59:33.232Z",
  "status": 403,
  "messages": [
    {
      "typename": "authentication",
      "message": "You must provide user credentials.",
      "data": {
        "credentials": "anonymous"
      }
    }
  ]
}
{% endhighlight %}

## JSONP Errors

When clients request responses in JSONP format, the API server will *always* respond with a 200 response code. This prevents the web browser swallowing the HTTP response without giving the Javascript callback a chance to process it.

It is always possible to identify an error response from a successful one by looking at the `typename` field. The would-be HTTP status code is included in the `status` field.
