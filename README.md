# Install

```
npm install nq
```

NB: package is hosted on [http://search.npmjs.org/#/nq](NPM registry)

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