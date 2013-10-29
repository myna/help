---
layout: page
title: Quick Start
lead: Up and running with Myna for PHP.
---

## Installation

Using [Composer](http://getcomposer.org/) is the simplest way to install Myna for PHP. If you don't have [Composer](http://getcomposer.org/) installed already, do so now. Then add to the `require` section of your project's `composer.json` file:

{% highlight json %}
{
  "require" : { "myna/myna-php" : "dev-master" }
}
{% endhighlight %}


## Use

You need to know two things to use the client:

- Your deployment UUID.
- The ID of the experiment you want to run.

You can find your deployment UUID on the dashboard. Just choose any experiment and go to the "Deployment" tab.

Your experiment's ID can be found by clicking on an experiment and then viewing the "Experiment Settings" tab.

Once you have this information, to create a Myna client:

{% highlight php %}
$client = \Myna\Myna::init("<deployment UUID>");
{% endhighlight %}


### Getting a Suggestion

With a client you can call the `suggest` method to get a suggestion. **The `suggest` method must be called before any output from your script, including `<html>`, as it needs to set a cookie. See [setcookie](http://php.net/manual/en/function.setcookie.php) for more.**

{% highlight php %}
try {
    $variant = $client->suggest("<experiment ID>");
} catch (Exception $e) {
    // Add your own error handling. You probably want to log the
    // exception and make sure you display some default variant.
}
{% endhighlight %}

This returns a `Variant` object. You can access properties of this object to get the name, ID, and settings of this variant:

{% highlight php %}
$name = $variant->name;
$id = $variant->id;
$settings = $variant->settings;
{% endhighlight %}

Myna for PHP remembers the suggestion show to a user (using a cookie) and always returns the same suggestion for each user.

### Making a Reward

Making a reward is simple:

{% highlight php %}
try {
    $client->reward("<experiment ID>");
} catch (Exception $e) {
    // Log the error
}
{% endhighlight %}

This will reward the suggestion made earlier.
