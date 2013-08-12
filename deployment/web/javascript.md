---
layout : page
title  : Custom Javascript
---

In complex dynamic web sites, the standard `data-` tags described in [previous](variants.html) [sections](goals.html) may not be sufficient to your needs. For example, if you use Javascript to dynamically populate your page, you may need to delay Myna initialisation until your data has loaded.

In these situations you can use Javascript to access the information stored on your dashboard. Here is a brief synopsis:

{% highlight javascript %}
// Register a callback to be triggered when Myna has finished initialisation.
// The callback will be triggered after the document ready event but before Myna
// starts processing data- tags in your page:
Myna.ready(function (client) {
  // Register a *view* callback on an experiment with ID "foo":
  client.experiments.foo.on("view", function(variant) {

    // Call a custom view function passing in the variant's ID and a few key settings:
    initVariant(variant.id, variant.settings.get("button.color"), variant.settings.get("button.label"));

  });

  // Register a *reward* callback on an experiment with ID "foo":
  client.experiments.foo.on("reward", function(variant, amount) {

    // Call a custom reward function passing in the variant's ID:
    variantRewarded(variant.id);

  });

  // Manually ask Myna for a variant suggestion for an experiment with ID "bar":
  client.experiments.bar.suggest();

  // Manually trigger a reward when the user submits a form:
  $("#signup-form-submit-button").on("click", function() {
    client.experiments.bar.reward();
  });

  // Manually choose the variants for experiment "baz" based on your own custom user data:
  if(MyApp.user.isLoggedIn()) {
    client.experiments.baz.view("variant1");
  } else {
    client.experiments.baz.view("variant2");
  }

  // Note: after the Myna.ready callback is complete, the client is available
  // as the global variable window.Myna.client.

});
{% endhighlight %}

## Programmatic View / Reward

 - TODO: Document the `view` and `reward` methods.

 - TODO: Document how cookies are used to cache views/rewards.

## Events

 - TODO: Document the `view` and `beforeView` events.

 - TODO: Document the `reward` and `beforeReward` events.

 - TODO: Document the `sync` and `beforeSync` events.

 - TODO: Document the effects of cookies on these events.

## More Information

 - TODO: Link to the full reference documentation for *Myna for Javascript* and *Myna for HTML*.
