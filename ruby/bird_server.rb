# frozen_string_literal: true

require 'socket'
require './bird_controller'

socket = TCPServer.new(333)

Response = Struct.new(:code, :message, :headers, :body) do
  def to_s
    "HTTP/1.1 #{code} #{message}\r\n\
#{headers.map { |k, v| "#{k}: #{v}" }.join("\r\n")}\r\n\
\r\n\
#{body}"
  end
end

BirdController.new

def do_request(method, uri, headers, body)
  result = BirdController.do_handler(method, uri, headers, body)
  headers = DEFAULT_HEADERS.dup
  headers[:'Content-Length'] = result.bytes.length
  Response.new(200, 'OK', headers, result)
end

DEFAULT_HEADERS = {
  'Location': 'http://localhost:333',
  'Content-Type': 'text/plain',
  'Content-Length': '0'
}.freeze

loop do
  client = socket.accept
  until (start_line = client.gets); end
  match = start_line.match(%r{(GET|POST|PUT|DELETE) ([/\w\d]+) HTTP/1\.1})
  response = if match.nil?
               Response.new(400, 'Bad Request', DEFAULT_HEADERS, '')
             else
               method = match[1]
               uri = match[2]
               headers = {}
               body = ''
               while (line = client.gets)
                 break if line == "\r\n"

                 k, v = line.split(': ')
                 headers[k] = v
               end
               body = client.gets(nil, headers['Content-Length'].to_i) if headers.key? 'Content-Length'
               do_request(method, uri, headers, body)
             end

  puts response
  client.puts(response.to_s)
  client.close
end

socket.close