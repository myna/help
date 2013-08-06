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

Each technique is described in detail below.

#### Showing and Hiding Content

Let’s say you want to test different variants of a paragraph of text. One way of doing this is to include every variant of the image in your page and hide them all except one. Here’s how you do it:

## Previewing your variants

## Using Javascript

## Integrating with Google Analytics
