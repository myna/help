---
layout: page
title: Base Experiment
lead:
---

A `BaseExperiment` is a low-level representation of an experiment


### new BaseExperiment(options)

Constructs a new `BaseExperiment` from the given `options`.


### BaseExperiment#suggest([success], [error])

### BaseExperiment#view(variantOrId, [success], [error])

### BaseExperiment#reward([amount], [success], [error])

Enqueue a reward event for submission to the Myna server. The parameters are:

- The `amount`, if specified, is the amount of the reward. It defaults to 1.0
- The optional `success` callback is called when the reward is successfully submitted.
- The optional `error` callback is called if there is an error.

The variant that is rewarded is the last variant to be viewed for this experiment. The following events are fired:
