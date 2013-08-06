---
layout: page
title:  Experiment Search
---

## Request Format

Retrieve the current state of all experiments for the authenticated account.

Like the "read experiment" endpoint, but retrieves an array of experiment
data for every experiment on the account.

By default only *published* experiments are returned. This behaviour can be
changed using the `visibility` parameter.

There are several optional request parameters are as follows:

 - `q` - a search term that searches on the experiment name and UUID;
 - `visibility` - a comma-separated list of the visibility of experiments to
   return. For example:
   - `published` - return published experiments only (default value);
   - `draft` - return draft experiments only;
   - `published,archived` - return published and archived experiments only;
 - `sort` - result sort order: `uuid-asc`, `uuid-desc`, `name-asc` or `name-desc`;
 - `limit` - the number of results to return (defaults to 25);
 - `skip` - the index of the first result to return (allows paging through results,
   defaults to 0).

{% highlight http %}
GET /v2/experiment?q=term&visibility=draft,published&sort=name-asc HTTP/1.1
Host: api.mynaweb.com
{% endhighlight %}

## Response Format

The response is an object containing a single key, `results` containing an array of experiments. Each experiment is in the format returned by the [experiment read](experiment-read.html) endpoint.

We may add more keys to the response in the future to return, for example, paging and search parameter information.

{% highlight http %}
GET /v2/experiment HTTP/1.1
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  "results": [
    // Array of results in the format returned by experiment read...
  ]
}
{% endhighlight %}

## API Keys and Experiment Summaries

When an API key is used to access the endpoint, certain fields are
omitted to avoid leaking sensitive customer data. API keys are also
unable to retrieve data for experiments with "archived" visibility.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  "results": [
    // Array of results in the format returned by experiment read...
  ]
}
{% endhighlight %}