#!/usr/bin/env ruby

require "rubygems"
require "json"
require "net/http"
require "uri"
require "byebug"
 
class Opsgenie

  def initialize(api_key)
    @api_key = api_key
    @url_prefix = 'https://api.opsgenie.com/v1/json/alert'
  end

  def self.fetch_json(uri, params, req_type)
    uri = URI(uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    begin
      if req_type=='post'
        res = https.post(uri.path, params) 
      else
        uri.query = URI.encode_www_form(params) if params
        res = Net::HTTP.get_response(uri)
      end
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body)
      else
        return false
      end
    rescue
      return false
    end
    
  end

  def send_alert message
    params = "{ \"apiKey\":\"#{@api_key}\", \"message\":\"#{message}\" }"
    response =  Opsgenie.fetch_json(@url_prefix, params, 'post')
    return response==false ? 'Alert could not be generated.':'Alert generated.'
  end

  def test_alert
    puts "Testing alert service."
    params = "{ \"apiKey\":\"#{@api_key}\", \"message\":\"testalert\" }"
    response = Opsgenie.fetch_json(@url_prefix, params, 'post')
    return response==false ? 'Alert could not be generated.':'Alert generated.'
  end

end
