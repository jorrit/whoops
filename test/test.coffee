Whoops = require '..'
should = require 'should'
isType = require 'is-type'

describe 'Whoops ::', ->

  describe 'without factory', ->
    it 'basic', ->
      err = new Whoops
      isType.error(err).should.be.equal true
      err.name.should.be.equal 'Error'
      (!!err.code).should.be.equal false
      (!!err.description).should.be.equal false
      (!!err.message).should.be.equal false

  describe 'object factory', ->
    it 'providing message', ->
      err = new Whoops
        message: 'damn'

      isType.error(err).should.be.equal true
      err.name.should.be.equal 'Error'
      err.message.should.be.equal 'damn'

    it 'providing mesage and name', ->
      err = new Whoops
        name: 'DAMN'
        message: 'something is wrong'

      isType.error(err).should.be.equal true
      err.name.should.be.equal 'DAMN'
      err.message.should.be.equal 'something is wrong'

    it 'providing mesage, name and more fields',  ->
      err = new Whoops
        name: 'DAMN'
        message: 'something is wrong'
        path: process.cwd()

      isType.error(err).should.be.equal true
      err.name.should.be.equal 'DAMN'
      err.message.should.be.equal 'something is wrong'
      err.path.should.be.equal process.cwd()


  describe 'string factory', ->
    it 'providing message', ->
      err = new Whoops 'damn'
      isType.error(err).should.be.equal true
      err.name.should.be.equal 'Error'
      err.message.should.be.equal 'damn'

    it "providing mesage and name", ->
      err = new Whoops 'DAMN', 'something is wrong'
      isType.error(err).should.be.equal true
      err.name.should.be.equal 'DAMN'
      err.message.should.be.equal 'something is wrong'

    it "providing mesage, name and code", ->
      err = new Whoops 'DAMN', 'ENOCODE', 'something is wrong'
      isType.error(err).should.be.equal true
      err.name.should.be.equal 'DAMN'
      err.code.should.be.equal 'ENOCODE'
      err.message.should.be.equal 'ENOCODE, something is wrong'
