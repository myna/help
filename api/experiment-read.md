---
layout: page
title:  Experiment Read
lead:   Get the details of a single experiment from your account.
---

## Request Format

{% highlight http %}
GET /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa HTTP/1.1
Host: api.mynaweb.com
{% endhighlight %}

## Response Format

A JSON object with the following fields:

 - `uuid` - unique experiment UUID;
 - `accountId` - customer UUID *(full access only)*;
 - `name` - human-readable name for the experiment;
 - `settings` - experiment settings;
 - `variants` - a hash of variant names and associated data:
    - `views` - the number of views so far *(full access only)*;
    - `totalReward` - the total reward accumulated so far *(full access only)*;
    - `weight` - the probability with which the client should show this variant
        for optimum experimental performance (see below);
    - `settings` - a hash of variant settings.

Example:

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  "typename": "experiment",
  "subtype": "complete",
  "uuid": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
  "accountId": "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb",
  "name": "My first experiment",
  "settings": {
    "defaultButtonColor": "green",
    "defaultButtonLabel": "Subscribe now"
  },
  "variants": {
    "baseline": {
      "views": 0,
      "totalReward": 0.0,
      "weight": 0.25,
      "settings": {}
    },
    "variant1": {
      "views": 0,
      "totalReward": 0.0,
      "weight": 0.25,
      "settings": {
        "buttonColor": "gold"
      }
    },
    "variant2": {
      "views": 0,
      "totalReward": 0.0,
      "weight": 0.25,
      "settings": {
        "buttonColor": "green",
        "buttonLabel": "Let's go!",
        "animateBackground": true
      }
    },
    "madVariant": {
      "views": 0,
      "totalReward": 0.0,
      "weight": 0.25,
      "settings": {
        "extraChickens": 16
      }
    }
  }
}
{% endhighlight %}

## A Note on Weights

Myna's machine learning algorithms constantly optimize the test by predictively
calculating the future conversion rate of each variant. Myna uses this data to
create a set of `weights` that indicate the percentage of the time that clients
should show each variant to users.

To run the most efficient A/B test in terms of conversions and page views, clients
should use the weights from the server to randomly select a variant for display to
the user. Clients may choose to ignore the weights to implement some other testing
strategy.

Weights sum to 1.0.

## API Keys and Summary Responses

When an API key is used to access the endpoint, certain fields are omitted to avoid leaking sensitive customer data.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  "typename": "experiment",
  "subtype": "summary",
  "uuid": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
  "name": "My first experiment",
  "settings": {
    "defaultButtonColor": "green",
    "defaultButtonLabel": "Subscribe now"
  },
  "variants": {
    "baseline": {
      "weight": 0.25,
      "settings": {}
    },
    "variant1": {
      "weight": 0.25,
      "settings": {
        "buttonColor": "gold"
      }
    },
    "variant2": {
      "weight": 0.25,
      "settings": {
        "buttonColor": "green",
        "buttonLabel": "Let's go!",
        "animateBackground": true
      }
    },
    "madVariant": {
      "weight": 0.25,
      "settings": {
        "extraChickens": 16
      }
    }
  }
}
{% endhighlight %}

## JSONP

A `callback` parameter may be specified to get the results in JSONP format.

{% highlight http %}
GET /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa?callback=myCallback HTTP/1.1
Host: api.mynaweb.com
{% endhighlight %}

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/javascript
Content-Length: <length>

myCallback({
  // Same response data as above...
});
{% endhighlight %}