_original = Meteor.call

@stubMeteorMethod = (methodName, error, ret) ->
  s = Meteor.call
  spy = sinon.spy()
  Meteor.call = () =>
    if arguments[0] == methodName
      lastArg = _.last(arguments)
      spy()
      if typeof lastArg == 'function'
        lastArg(error, ret)
    else
      s.apply(@, arguments)
  return spy

@restoreMethodStubs = () ->
  Meteor.call = _original