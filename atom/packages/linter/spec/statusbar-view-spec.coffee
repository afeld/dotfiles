StatusBarView = require '../lib/statusbar-view.coffee'
sinon = require 'sinon'
chai = require 'chai'

chai.should()

{Range, Point} = require 'atom'

describe 'StatusBarView', ->
  [statusBarView, showTheStatusBar] = []

  beforeEach ->
    statusBarView = new StatusBarView()

    showTheStatusBar = (messages, position) ->
      messages = messages || [{
        linter: 'foo'
        message: 'bar'
        line: 0
        col: 1
        range: new Range([0, 1], [0, 3])
      }]

      position = position || {row: 0, column: 1}

      # Faking we are on an error line
      statusBarView.computeMessages messages, position, 1, false

  afterEach ->
    statusBarView.remove()
    statusBarView = null

  it "should not be visible", ->
    statusBarView.is(':visible').should.be.false

  it "should append violation into status bar", ->
    spy = sinon.spy(statusBarView, 'show')

    showTheStatusBar()

    # `@show` should have been called, so the view is visible
    spy.should.have.been.calledOnce

    # html should have correctly added into the status bar
    statusBarView.find('.error-message').text().should.be.eql('bar')
    statusBarView.find('dt > span').text().should.be.eql('foo')
