help
====

Help and documentation for Myna.

Building
--------

The help site is built with [Grunt][], [Bower][], [Jekyll][], and a host of plugins for each. We also use [Bundler][] to install Jekyll and its plugins.

[Grunt]: http://gruntjs.com
[Bower]: http://bower.io
[Jekyll]: http://jekyllrb.com
[Bundler]: http://bundler.io

To get started, install Bundler:

    npm install -g grunt-cli
    npm install -g bower
    gem install bundle

Use Bundler to update the dependencies of the help site:

    cs ./path-to-repo-root
    npm install
    bower install
    bundle install

Build the site (this will pause and watch for changes):

    grunt -v

Finally, open the site in your browser:

    open http://localhost:4000

Contributing
------------

Fork and submit a pull request!
