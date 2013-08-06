---
layout: page
title: Authentication
lead: Myna provides a variety of authentication methods to control access to the API
---

Myna provides two ways to control access to the API:

- Authentication using your email and password
- Authentication using an API key

In most cases you will use an API key. You can create and delete API keys at will, so you generate different keys, for example, to use on a publicly accessibly website and on an internal dashboard.

## Authenticating

In all cases you authenticate by sending an `Authorization` HTTP header. The value of this header is determined by your choice of login details or API key.

### Using Login Details

Login details (email address and password) are sent using the standard [basic access authentication](http://en.wikipedia.org/wiki/Basic_access_authentication) method. The header looks like:

{% highlight bash %}
Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==
{% endhighlight %}

Where the string `QWxhZGRpbjpvcGVuIHNlc2FtZQ==` is the Base64 encoding of the string consisting of your email address, a colon, and your password. In this case the email address is `Aladdin` and the password is `open sesame`.

Basic access authentication sends passwords in clear text. To ensure your password is not compromised you should only make SSL encrypted (HTTPS) calls to when authenticating using this method.


### Using an API Key

Authenticating using an API key uses a header that looks like:

{% highlight bash %}
Authorization: ApiKey <api-key>
{% endhighlight %}

Replace `<api-key>` with your actual key.

Since you can create and destroy API keys at any time, you don't have to worry about sending API keys over an unencrypted (HTTP) connection. If you suspect an API key is being used by someone else, you can simply delete that key and create a new one.


## API Key Permissions

API keys are currently only able to to two things:

- download the minimum view of experiment state required to run published experiments via the "read experiment" and "experiment search" endpoints;
- record page views and rewards via the "record experiment data" endpoint.

In the future we will add permission levels to API keys, allowing you to create and modify experiments using privileged keys.
