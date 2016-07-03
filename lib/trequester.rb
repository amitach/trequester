require "trequester/version"
require 'trequester/trequester'
require 'httparty'

module Trequester
  class << self
    attr_accessor :auth

    def setup(key_id, key_secret)
      self.auth = { username: key_id, password: key_secret }
    end
  end
end
