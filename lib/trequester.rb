require "trequester/version"
require 'httparty'

module Trequester
  class Request
    include HTTParty
    #initialized the base URL,
    #Since we are including the HTTParty module the base_uri method is available as a method on the eigen class
    def initialize(root_endpoint)
      @root_endpoint = root_endpoint
      self.class.base_uri(root_endpoint)
    end

    #To be used primarily for get requests
    def fetch(rest_of_the_url)
      request :get, "#{@root_endpoint}#{@entity_name}/#{rest_of_the_url}"
    end

    #make the actual request
    def request(method, url, data = {})
      self.class.send(method, url, query: data)
    end
  end
end
