throttle_call = (f, max_simultaneous) ->
  # f: a function which takes 1 argument
  if not max_simultaneous?
    max_simultaneous = 1
  count = 0
  waiting = []
  throttled_func = (params, cb) ->
    if count < max_simultaneous
      count := count + 1
      f params, ->
        count := count - 1
        if waiting.length > 0
          throttled_func.apply null, waiting.shift()
        cb.apply this, arguments
    else
      waiting.push arguments
  return throttled_func

module.exports = throttle_call