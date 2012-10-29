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
npm run-script _build
```