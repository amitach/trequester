require 'httparty'
require '../trequester/version'
require '../trequester/trequester'

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
      request :get, "#{@root_endpoint}#{rest_of_the_url}/#{rest_of_the_url}"
    end

    def post(rest_of_the_url, data)
      request :get, "#{@root_endpoint}#{rest_of_the_url}/#{rest_of_the_url}", data
    end

    #make the actual request
    def request(method, url, data = {})
      case method
        when :get || :post
          self.class.send(method, url, query: data, basic_auth: Trequester.auth)
        else
          raise 'Not a valid method'
      end
    end
  end
end