---
layout : page
title  : Conversion Goals
---

Myna supports two types of conversion goal:

 - *Click goals* record conversions when a visitor clicks on a link or button or another element on your page.
 - *Page load goals* record conversions when a visitor arrives on a particular page.

### Specifying Click Goals

You can set up a click goal as follows:

<ol>
<li>
<p>Add an HTML element to your page. It can be a link or button or any other type of element:</p>

{% highlight html %}
<a href="goal.html">Click here</a>
{% endhighlight %}
</li>

<li>
<p>Tag the element with the CSS class for your experiment:</p>

{% highlight html %}
<a class="myna-experimentid" href="goal.html">Click here</a>
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-goal</code> attribute to the element:</p>

{% highlight html %}
<a class="myna-experimentid" data-goal="click" href="goal.html">Click here</a>
{% endhighlight %}
</li>
</ol>

A reward will be send to Myna when a web site visitor clicks on the element in response to a being shown a variant.

### Specifying Page Load Goals

You can set up a page load goal as follows:

<ol>
<li>
<p>Tag the <code>&lt;body&gt;</code> or <code>&lt;html&gt;</code> tag of your page with the CSS class for your experiment:</p>

{% highlight html %}
<body class="myna-experimentid">
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-goal</code> attribute to the element:</p>

{% highlight html %}
<body class="myna-experimentid" data-goal="load">
{% endhighlight %}
</li>
</ol>

A reward will be send to Myna whenever a user loads this page after a suggestion is made.

**Pro tip:** If you are using this approach, it is likely that your goal page is different from the page you are testing with Myna. You must make sure your *deployment snippet* is present in *both* pages for this approach to work (see *Getting Up and Running* above).

## Previewing your Variants

Add `#preview` to the end of the web address on your page to show the *Myna inspector*. This allows you to preview your variants and simulate conversions without recording experiment data on your dashboard or using up your quota.

**Pro tip:** Preview mode only works once you have added the *deployment snippet* to your page (see *Getting Up and Running* above).

<p class="alert">
  TODO: Myna inspector.
</p>

## Using Javascript

<p class="alert">
  TODO: Javascript events.
</p>

## Integration with Google Analytics

Myna automatically publishes two kinds of [custom events][] to Google Analytics:

 - *View events* - whenever Myna selects a variant for one of your experiments;
 - *Reward events* - whenever a user triggers a conversion goal.

[custom events]: https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide

The event parameters are as follows:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Parameter</th>
      <th>View event</th>
      <th>Reward event</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Category</td>
      <td>myna</td>
      <td>myna</td>
    </tr>
    <tr>
      <td>Action</td>
      <td><em>experimentid</em>-view</td>
      <td><em>experimentid</em>-reward</td>
    </tr>
    <tr>
      <td>Label</td>
      <td><em>variantid</em></td>
      <td><em>variantid</em></td>
    </tr>
    <tr>
      <td>Value</td>
      <td>-</td>
      <td><em>rewardamount</em> * 100</td>
    </tr>
    <tr>
      <td>Interactivity</td>
      <td>Non-interactive</td>
      <td>Interactive</td>
    </tr>
  </tbody>
</table>

<p class="alert">
  TODO: Customising Google Analytics behaviour.
</p>
