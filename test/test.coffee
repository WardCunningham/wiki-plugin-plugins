# build time tests for plugins plugin
# see http://mochajs.org/

plugins = require '../client/plugins'
expect = require 'expect.js'

describe 'plugins plugin', ->

  describe 'expand', ->

    it 'can make html safe', ->
      result = plugins.expand 'hello & goodbye'
      expect(result).to.be 'hello &amp; goodbye'
