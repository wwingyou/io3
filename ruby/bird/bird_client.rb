# frozen_string_literal: true

require 'net/http'

if ARGV.length < 2
  puts 'usage: bird_client <method> <uri> <data>'
  exit 1
end

method = case ARGV[0]
         when 'get'
           Net::HTTP::Get
         when 'post'
           Net::HTTP::Post
         when 'put'
           Net::HTTP::Put
         when 'delete'
           Net::HTTP::Delete
         else
           puts "invalid method: #{ARGV[1]}"
         end
uri = URI.parse("http://localhost:333#{ARGV[1]}")
data = ARGV[2] if ARGV.length >= 3

Net::HTTP.start(uri.hostname, uri.port) do |http|
  request = method.new uri
  request.body = data if data

  response = http.request request
  case response.code[0]
  when '2'
    puts response.body
  when '3'
    uri.path = response['Location']
    puts Net::HTTP.get(uri)
  when '4', '5'
    warn "#{response.code} #{response.message}"
  end
end
