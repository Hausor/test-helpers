methodName = "textMethod"

describe 'stubMeteorCall', ->
  beforeEach ->
    @spy = stubMeteorMethod(methodName, "errorVal", "successVal")

  it 'updates spy after called', ->
    Meteor.call(methodName)
    expect(@spy).to.have.been.called.once

describe 'restoreMethodStubs', ->
  beforeEach  ->
    @spy = stubMeteorMethod(methodName, "errorVal", "successVal")

  it 'restores all method stubs after calling restoreMethodStubs', ->
    restoreMethodStubs()
    expect(() -> Meteor.call(methodName)).to.throw("404") if Meteor.isServer

  it 'restores all method stubs after calling stubs.restoreAll', ->
    stubs.restoreAll()
    expect(() -> Meteor.call(methodName)).to.throw("404") if Meteor.isServer

  it 'doesnt change how original stubs.restoreAll works', ->
    expect(Meteor.userId()).not.to.equal "caller"
    stubs.create("normalUserIdStub", Meteor, "userId").returns "caller"
    expect(Meteor.userId()).to.equal "caller"
    stubs.restoreAll()
    expect(Meteor.userId()).not.to.equal "caller"
    
    