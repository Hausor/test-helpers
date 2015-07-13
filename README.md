Test helpers for testing meteor packages usning mocha
============================================

How to use it
--------------------------------------------

In package.js under Package.onTest section add 

    api.use('hausor:test-helpers');

and you are ready to go.

Actual helpers
--------------------------------------------

This simple package provides you with 2 helpers

### renderTemplate(name, data, done)

As a name suggests - it renders template by given name.

parameters:

- **name**: template name
- **data**: template context data
- **done**: test done callback function

returns: jquery object with rendered template.

How to use it (coffeescript): 

```coffeescript
describe "some awesome template", ->
  beforeEach (done) ->
    @div = renderTemplate("awesomeTemplate", {headerText: "Awesome"}, done)

  it 'contains awesome text', ->
    expect(@div.text()).to.contain "Awesome"
```

In case of no context data just ommit it: renderTemplate(name, done)

### stubMeteorMethod(methodName, error, success)

Since you cannot simply stub meteor method with sinon.stub (because velocity uses it to do her things) stubMeteorMethod simply wraps Meteor.call it and filter out only particular "method".

parameters:

- **methodName**: name of the stubbed method
- **error**: error parameter of asyncCallback function
- **success**: success parameter of asyncCallback function

returns: sinon.js spy

restore: to restore method to its original state call: `restoreMethodStubs()` or sinon's stubs.restoreAll()

How to use it (coffeescript):

Let say you would like to stub following method call:

```coffeescript
Meteor.call "myAwesomeMethod", (error, success) ->
  if error
    sth
  else
    user = Meteor.users.findOne(success)
```


to stub success call just write:

```coffeescript
describe "some method interaction", ->
  beforeEach ->
    @methodSpy = stubMeteorMethod("myAwesomeMethod", null, "successUserID")
    Method.call("myAwesomeMethod")

  afterEach ->
    stubs.restoreAll()

  it 'calls the method', ->
    expect(@methodSpy).to.have.been.called.once

```

To see tests just run:

    meteor test-packages --driver-package respondly:test-reporter hausor:test-helpers

## Contributing

Anyone is welcome to contribute. Fork, make your changes, and then submit a pull request.

