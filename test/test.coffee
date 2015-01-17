# build time tests for plugins plugin
# see http://mochajs.org/

plugins = require '../client/plugins'
expect = require 'expect.js'

describe 'plugins plugin', ->

  describe 'expand', ->

    it 'can make itallic', ->
      result = plugins.expand 'hello *world*'
      expect(result).to.be 'hello <i>world</i>'
