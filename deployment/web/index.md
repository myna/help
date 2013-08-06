---
layout : page
title  : Deploying Experiments on the Web
lead   : Deploy experiments from your dashboard to your web site using just a few lines of HTML.
---

Web deployments use Myna's HTML5 client library, *Myna for HTML*.

On your dashboard we provide you with a snippet of code that you can copy and paste into the header of your page template. Once you have done this you can set up variants and conversion goals for all of your web experiments, *without* doing any programming!

## Getting Up and Running

First, copy and paste the **deployment snippet** from your dashboard to your web site. You can find the snippet on the *Deployment* tab of any experiment. It looks like this:

{% highlight html %}
<!-- Begin Myna snippet -->
<script src="//deploy.mynaweb.com/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/myna.js"></script>
<!-- End Myna snippet -->
{% endhighlight %}

The code `aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa` will be a unique identifier for your account.

Copy and paste this snippet just above the `</head>` or `</body>` tag. You'll need it on every page that is involved in one or more of your experiments. *We recommend pasting it into your global page template so you can run experiments anywhere on your site.*

Once the snippet is present on your site, you can mark up and run any experiment from your Myna dashboard.

## Designing Variants

You can design variants by adding *variant settings* on your dashboard and referencing them in your HTML. There are several kinds of change you can make:

 1. swap content in and out by showing and hiding HTML elements;
 2. restyle content by adding and removing CSS classes;
 3. alter the text in an element;
 4. alter an attribute on an element (e.g. the `src` attribute on an image or iframe).

Each technique is described in detail below. The basic technique for all variants is:

 1. Add a *variant setting* to your dashboard.
 1. Add an HTML element to your page.
 2. Tag the HTML element with the CSS class for your experiment.
 3. Annotate the HTML element with `data-` attributes to bind it to the settings on your dashboard.

### Showing and Hiding Content

Let’s say you want to test different variants of a paragraph of text. One way of doing this is to include every variant of the paragraph in your page and hide all of them except one. Here’s how you do it:

<ol>
<li>
<p>Add the paragraphs to your page:</p>

{% highlight html %}
<p>This is variant A.</p>
<p>This is variant B.</p>
{% endhighlight %}
</li>

<li>
<p>Annotate each element with the CSS class for your experiment:</p>

{% highlight html %}
<p class="myna-experimentid">This is variant A.</p>
<p class="myna-experimentid">This is variant B.</p>
{% endhighlight %}
</li>

<li>
<p>Annotate each element with a `data-show` attribute and the ID of the variant you want to show it in:</p>

{% highlight html %}
<p class="myna-experimentid" data-show="a">This is variant A.</p>
<p class="myna-experimentid" data-show="b">This is variant B.</p>
{% endhighlight %}
</li>
</ol>

**Pro tip:** You may want to use CSS to hide the images by default or fix the size of a container to avoid unwanted pop-in while your page is loading.

### Restyling Content

You may want to vary the style of an element in addition to or instead of its content. You can do this as follows:

<ol>
<li>
<p>On your dashboard, create a <em>variant setting</em> called &quot;cssclass&quot; (or something similar), and assign a different class name to each variant:</p>

<img class="center" src="http://placehold.it/350x150">
</li>

<li>
<p>Add the element to your page:</p>

{% highlight html %}
<div>...</div>
{% endhighlight %}
</li>

<li>
<p>Tag the element with the CSS class for your experiment:</p>

{% highlight html %}
<div class="myna-experimentid">...</div>
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-bind</code> attribute to the element specifying the name of the setting on your dashboard:</p>

{% highlight html %}
<div class="myna-experimentid" data-bind="class=cssclass">...</div>
{% endhighlight %}
</li>
</ol>

Myna will add a CSS class to your element corresponding to the relevant value of the setting on your dashboard. For example, if your web site visitor is shown a variant with the setting value `cssclass1`, the element will end up like this:

{% highlight html %}
<div class="myna-experimentid cssclass1">...</div>
{% endhighlight %}

### Changing Links or Button Labels

For small snippets of text like button labels, rather than show and hide complete sections of the page, it can be easier to save the text in a setting on the Myna dashboard and send it to the web page on demand:

<ol>
<li>
<p>On your Myna dashboard, create a setting called &quot;linklabel&quot; (or something similar) and assign each variant a different value:</p>

<img class="center" src="http://placehold.it/350x150">
</li>

<li>
<p>Add a link or button to your page, and assign it the CSS class of your experiment:</p>

{% highlight html %}
<a class="myna-experimentid" href="goal.html">Sign up now!</a>
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-bind</code> attribute to the link to bind its text to the value of your setting on the Dashboard:</p>

{% highlight html %}
<a class="myna-experimentid" data-bind="text=linklabel" href="goal.html">Sign up now!</a>
{% endhighlight %}
</li>
</ol>

Myna will automatically update the text on your web page to match the value on your dashboard. For example, if the relevant variant has its `linklabel` set to *Click here for information*, your web site visitor will see a link that looks like this:

{% highlight html %}
<a class="myna-experimentid" href="goal.html">Click here for information</a>
{% endhighlight %}

**Pro tip:** There are two versions of `data-bind` for changing the text of an element:

 - `data-bind="text=setting"` treats the value of your setting as plain text, and *escapes* any characters that have special meanings in HTML: `<` becomes `&lt;`, `&` becomes `&amp;` and so on;

 - `data-bind="html=setting"` treats the value of your setting as raw HTML, allowing you to write HTML tags like `<strong>` and `<em>`.

### Changing Image Sources

You can use *variant settings* to specify alternate values of any HTML attribute on your page. For example, you can bind the `src` attribute on one of your images to a setting, allowing your to specify a different image for each variant:

<ol>
<li>
<p>On your Myna dashboard, create a setting called &quot;imagesrc&quot; (or something similar) and assign each variant a different value:</p>

<img class="center" src="http://placehold.it/350x150">
</li>

<li>
<p>Add an image tag to your page, and assign it the CSS class of your experiment. Leave the <code>src</code> attribute blank to avoid visual glitches when your page loads:</p>

{% highlight html %}
<img class="myna-experimentid" src="">
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-bind</code> attribute to the image to bind its <code>src</code> attribute to the value of your setting on the Dashboard:</p>

{% highlight html %}
<img class="myna-experimentid" data-bind="@src=imagesrc" src="">
{% endhighlight %}
</li>
</ol>

Myna will automatically update the attribute to match the value on your dashboard. For example, if the relevant variant has its `imagesrc` set to */images/image1.jpg*, your web site visitor will see a link that looks like this:

{% highlight html %}
<img class="myna-experimentid" src="/images/image1.jpg">
{% endhighlight %}

### Specifying Click Goals

*Click goals* record conversions when a web site visitor clicks on a link or button on your page. You can set up a click goal as follows:

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

*Page load goals* record conversions when a web site visitor loads a particular web page. You can set up a page load goal as follows:

<ol>
<li>
<p>Tag the <code>&lt;body&gt;</code> or <code>&lt;html&gt;</code> tag of your page with the CSS class for your experiment:</p>

{% highlight html %}
<body class="myna">
{% endhighlight %}
</li>

<li>
<p>Add a <code>data-goal</code> attribute to the element:</p>

{% highlight html %}
<body class="myna" data-goal="load">
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
