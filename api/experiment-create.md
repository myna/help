---
layout: page
title:  Experiment Create
lead:   Add a new experiment to your account.
---

## Request Format

Creates a new A/B test or "experiment". Accepts JSON as follows:

 - `name` - specifies a human-readable name for the experiment;

 - `visibility` - specifies whether the experiment is a `"draft"`, `"published"`, or `"archived"`:
   - "draft" experiments are work-in-progress - they have not been put into production yet;
   - "published" experiments are live on production web sites;
   - "archived" experiments have run their course and been taken out of production.
 - `settings` - a new set of settings for the experiment (see the "Settings" section above).
 - `settingsUpdates` - updates to the experiment's settings (see the "Settings" section above).
 - `variants` - a JSON object containing instructions for creating, editing, and deleting variants.

The field names in the variants object should be the IDs listed on the Myna dashboard. The values should be one of the following:

   - `null` - deletes the variant;
   - object literal - creates or updates the variant using zero or more of the following keys:
     - `name` - a new name for the variant (used when updating existing variants only);
     - `settings` - a new set of settings for the variant (see the "Settings" section above).
     - `settingsUpdates` - updates to the experiment's settings (see the "Settings" section above).

{% highlight http %}
POST /v2/experiment HTTP/1.1
Host: api.mynaweb.com
Content-Type: application/json; charset=utf-8
Content-Length: <length>

{
  "name": "My first experiment",
  "visibility": "published",
  "settings": {
    "defaultButtonColor": "green",
    "defaultButtonLabel": "Subscribe now"
  }
  "variants": {
    "baseline": {},
    "variant1": {
      "settings": {
        "buttonColor": "gold"
      }
    },
    "variant2": {
      "settings": {
        "buttonColor": "green",
        "buttonLabel": "Let's go!",
        "animateBackground": true
      }
    },
    "madVariant": {
      "settings": {
        "extraChickens": 16
      }
    }
  }
}
{% endhighlight %}

## Response Format

The endpoint returns the same output as the [read experiment](experiment-read.html) endpoint.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  // Same result format as the "read experiment" endpoint...
}
{% endhighlight %}

## API Keys

When an API key is used to access the endpoint, the data returned is abbreviated
to avoid leaking sensitive customer data to the client. See the *read experiment*
endpoint for more information.

{% highlight http %}
POST /v2/experiment HTTP/1.1
Host: api.mynaweb.com
Content-Type: application/json; charset=utf-8
Content-Length: <length>

{
  // As above...
}
{% endhighlight %}

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
  // Same abbreviated result format as the "read experiment" endpoint...
}
{% endhighlight %}