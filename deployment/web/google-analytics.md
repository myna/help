---
layout : page
title  : Google Analytics
lead   : "Myna integrates with Google Analytics right out of the box: No configuration necessary."
---

Myna automatically publishes two kinds of [custom events][] to Google Analytics:

 - *View events* - whenever Myna selects a variant for one of your experiments;
 - *Reward events* - whenever a user triggers a conversion goal.

[custom events]: https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide

To enable this feature, simply add the Google Analytics snippet to your web site along site the Myna deployment snippet. The event parameters are as follows:

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

## Customising Google Analytics Behaviour

<p class="alert">
  TODO: Customising Google Analytics behaviour.
</p>
