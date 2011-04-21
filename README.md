# client-share-web

The web UI used for the Firefox Share feature.

To use the code in this project while developing you need to [clone the API server
repo](https://github.com/mozilla/f1), and put it as a sibling to this directory.
Make sure to you have cloned this repo so its name on disk is **client-share-web**.

The UI is served in development by the Python server that runs from the API server
directory, and it will look for the **client-share-web** directory to be a sibling
to itself.

## Directory Layout

There are versioned directories, like "0.3.7". Those are releases that were deployed.

The unoptimized, development code is in the **dev** directory.

Normally the deployed code will run on a server that has a symlink in this
directory called **current** that will point to the proper versioned release
directory that should be running.

## Development approach

Code in this repo is subject to the Mozilla Contributor Agreement, and
[git flow](http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/)
is used to create bug/ branches that correspond to Bugzilla bug numbers to do fixes.

## Build

TODO


## License

Code in this repo is distributed under the (Mozilla Public License (MPL) 1.1)[http://www.mozilla.org/MPL/].
