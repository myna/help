---
layout: page
title: Settings
---

Every experiment and variant contains a hash of settings, which can be used to store useful metadata.

For example, variant settings can be used to store choices of layout, colours, and text. Experiment settings can be used to store user information for geographical targetting, Google Analytics integration, and so on.

Settings can be updated via the Myna API and dashboard without having to edit code on the target web site or app. You can use the APIs in Myna clients such as Myna for Javascript and Myna for iOS to access the latest settings and use them as necessary.

Settings can be updated via the API using two keys. The `settings` key is used for wholesale replacement of the settings for a given experiment or variant; the `settingsUpdates` key can be used to update individual settings without overwriting the whole hash.

For example, imagine a variant has the following settings:

{% highlight js %}
{
  "buttons": {
    "color": "green",
    "label": "Click me!"
  },
  "background": "tree.jpeg"
}
{% endhighlight %}

The developer can update the button color in one of two ways: by passing a complete new settings hash with the new color, label, and background image, or by passing a `settingsUpdates` hash with the following code:

{% highlight js %}
{
  "buttons.color": "blue"
}
{% endhighlight %}
