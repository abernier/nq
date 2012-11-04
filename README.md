# Install

```bash
npm install nq
```

_hosted on [NPM registry](http://search.npmjs.org/#/nq)_

# Usage

## Client side

```html
<script src="node_modules/nq/lib/index.js"></script>
```

## Server-side

```coffeescript
$ = require 'nq'
```

```coffeescript
$1 = require('nq').create(window1)
$2 = require('nq').create(window2)
```

# Dev

Requirements:

* [GNU make](http://www.gnu.org/software/make/)
* [GNU m4](http://www.gnu.org/software/m4/)

## Build

```bash
npm run _build
```

## Publish

* Be sure to have `npm adduser` you
* Bump `package.json.version`

Then:

```bash
npm publish
git tag -a vX.Y.Z -m 'Tagging X.Y.Z'
git push origin vX.Y.Z
```