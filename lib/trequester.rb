require "trequester/version"
require 'trequester'
require 'httparty'

module Trequester
  class << self
    attr_accessor :auth
  end

  def self.setup(key_id, key_secret)
    self.auth = { username: key_id, password: key_secret }
  end

end
