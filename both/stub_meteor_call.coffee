if stubs?
  _original = Meteor.call

  stubMeteorMethod = (methodName, error=null, success=null) ->
    s = Meteor.call
    spy = sinon.spy()
    Meteor.call = () =>
      if arguments[0] == methodName
        lastArg = _.last(arguments)
        spy()
        if typeof lastArg == 'function'
          lastArg(error, success)
        else
          s.apply(@, arguments)
    return spy

  restoreMethodStubs = () ->
    Meteor.call = _original

  _restoreAll = stubs.restoreAll
  stubs.restoreAll = () ->
    _restoreAll.apply(this)
    restoreMethodStubs()
