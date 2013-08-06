---
layout: page
title:  Experiment Update
lead:   Edit the name, ID, settings, and/or variant list of an experiment in your account.
---

## Request Format

Edit experiment ID/name/settings.

The `visibility` key allows you to change the visibility to "draft" or "published".

The `variantUpdates` key serves three purposes:

 - to create variants (as described in the "create experiment" endpoint);
 - to update variant settings (as described in the "create experiment" endpoint);
 - to delete variants (by "setting" the variant to `null`).

Different levels of authentication determine what data can be updated.
The lowest level is to accept just the `events`.

{% highlight http %}
PUT /v2/experiment/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa HTTP/1.1
Content-Type: application/json; charset=utf-8
Content-Length: <length>

{
    "name": "My first experiment (v2)",
    "visibility": "published",
    "settings": {
        "a.b.c": { "d": "e" },
        "x.y.z": null
    },
    "variantUpdates": {
        "baseline": {
            "name": "original",
            "settings": {
                "a.b.c": "b",
                "x.y.z": null
            }
        },
        "madVariant": null,
        "newVariant": {}
    }
}
{% endhighlight %}

## Response Format

Returns the same result as the [experiment read](experiment-read.html) endpoint.

{% highlight http %}
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: <length>

{
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
            "reward": 0.0,
            "weight": 0.25,
            "settings": {}
        },
        "variant1": {
            "views": 0,
            "reward": 0.0,
            "weight": 0.25,
            "settings": {
                "buttonColor": "gold"
            }
        },
        "variant2": {
            "views": 0,
            "reward": 0.0,
            "weight": 0.25,
            "settings": {
                "buttonColor": "green",
                "buttonLabel": "Let's go!",
                "animateBackground": true
            }
        },
        "madVariant": {
            "views": 0,
            "reward": 0.0,
            "weight": 0.25,
            "settings": {
                "extraChickens": 16
            }
        }
    }
}
{% endhighlight %}