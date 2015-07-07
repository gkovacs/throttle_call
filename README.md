# throttle_call

Throttles the number of simultaneous calls to a function

## Install

```
npm install throttle_call
```

## Using

```
throttle_call = require('throttle_call')

get_image_url = (query, callback) ->
  Bing.images query, {}, (error, res2, body) ->
    callback [x.MediaUrl for x in body.d.results]

get_image_url_throttled = throttle_call(get_image_url)
```

