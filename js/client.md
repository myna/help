---
layout: page
title: Client
lead: Client's are the main entry point to Myna for Javascript
---

A `Client` wraps up a number of [`Experiments`](experiment.html)

### new Client(options)

Constructs a `Client` from the given `options`. `Options` is a hash with the following elements:

- `uuid`: The deployment UUID. Currently unused.
- `apiKey`: The [API Key](/api/authentication.html) to use when contacting the Myna server. Required.
- `apiRoot`: The URI root of the Myna server. Defaults to `//api.mynaweb.com/`.
- `settings`: A `Settings` object. Currently unused.
- `experiments`: An array of `Experiment`s.

### Client#suggest(exptId, [success], [error])

### Client#view(exptId, variantId, [success], [error])

### Client#reward(exptId, amount, [success], [error])
