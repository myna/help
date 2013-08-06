---
layout: page
title: Authentication
lead: Myna provides a variety of simple authentication methods.
---

You can authenticate a request to the Myna API in three ways:

- using your email and password;
- using an *auth token*;
- using an API key.

In most cases you will use an API key. You can create as many API keys as you need to authenticate all of your client software.

In all cases you authenticate by sending an `Authorization` HTTP header. The value of this header is determined by your choice of login details.

## Email/Password Authentication

Login details (email address and password) are sent using the standard [basic access authentication](http://en.wikipedia.org/wiki/Basic_access_authentication) method. The header looks like:

{% highlight http %}
Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==
{% endhighlight %}

Where the string `QWxhZGRpbjpvcGVuIHNlc2FtZQ==` is the Base64 encoding of the string consisting of your email address, a colon, and your password. In this case the email address is `Aladdin` and the password is `open sesame`.

Basic access authentication sends passwords in clear text. To ensure your password is not compromised you should only make SSL encrypted (HTTPS) calls to when authenticating using this method.

## Auth Token Authentication

Auth tokens are a means for accessing the API without having to store your password in an insecure location. You can use the [user login](user-login.html) endpoint to exchange an email address and password for an auth token that will allow you to continue accessing the API. Auth tokens expire automatically after one hour of non-use, or when they are used to access the [user logout](user-logout.html) endpoint.

Auth token authentication uses an a header that looks like this:

{% highlight http %}
Authorization: Bearer aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
{% endhighlight %}

Replace `aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa` with your actual auth token.

## API Key Authentication

Authenticating using an API key uses a header that looks like this:

{% highlight http %}
Authorization: ApiKey bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb
{% endhighlight %}

Replace `bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb` with your actual API key.

Since you can create and destroy API keys at any time, you don't have to worry about sending API keys over an unencrypted (HTTP) connection. If you suspect an API key is being used by someone else, you can simply delete that key and create a new one.

### API Key Permissions

API keys are currently only able to to two things:

- download the minimum view of experiment state required to run published experiments via the "read experiment" and "experiment search" endpoints;
- record page views and rewards via the "record experiment data" endpoint.

In the future we will add permission levels to API keys, allowing you to create and modify experiments using privileged keys.
