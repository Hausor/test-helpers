Test helpers for testing meteor packages using mocha
============================================


Before you start
--------------------------------------------

If you don't know how to test your packages using mocha - read [testing-meteor-packages-with-mocha](https://blog.respond.ly/testing-meteor-packages-with-mocha/) and then use this [meteor-mocha-web](https://github.com/mad-eye/meteor-mocha-web/tree/packageTest)


This package depends on sinonjs: standalone test spies, stubs and mocks for JavaScript. To be exact on this meteorjs package: [practicalmeteor:sinon](https://atmospherejs.com/practicalmeteor/sinon)

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

#### parameters:

- **name**: template name
- **data**: template context data
- **done**: done callback

#### returns: 

jquery object with rendered template.

#### How to use it (coffeescript): 

```coffeescript
describe "some awesome template", ->
  beforeEach (done) ->
    @div = renderTemplate("awesomeTemplate", {headerText: "Awesome"}, done)

  it 'contains awesome text', ->
    expect(@div.text()).to.contain "Awesome"
```

In case of no context data just ommit it: `renderTemplate(name, done)`

### stubMeteorMethod(methodName, error, success)

Since you cannot simply stub meteor method with sinon.stub (because velocity uses it to do her things) `stubMeteorMethod` simply wraps Meteor.call it and filter out only particular method.

#### parameters:

- **methodName**: name of the stubbed method
- **error**: error parameter of asyncCallback function
- **success**: success parameter of asyncCallback function

#### returns: 

[sinon.js spy](http://sinonjs.org/docs/#spies)

to restore method to its original state call: `restoreMethodStubs()` or sinon's `stubs.restoreAll()`

#### How to use it (coffeescript):

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

## Tests

To run tests:

    meteor test-packages --driver-package respondly:test-reporter hausor:test-helpers

## Contributing

Anyone is welcome to contribute. Fork, make your changes, and then submit a pull request.

