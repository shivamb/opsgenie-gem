#!/usr/bin/env ruby

require 'byebug'
require 'opsgenie'

api_key = '<api-key-here>'
msg = ARGV[0] || 'Anonymous alert!'
og = Opsgenie.new(api_key)
og.send_alert msg