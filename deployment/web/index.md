---
layout : page
title  : Deploying on the Web
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
