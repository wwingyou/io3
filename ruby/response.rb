# frozen_string_literal: true

Response = Struct.new(:code, :message, :headers, :body) do
  def to_s
    "HTTP/1.1 #{code} #{message}\r\n\
#{headers.map { |k, v| "#{k}: #{v}" }.join("\r\n")}\r\n\
\r\n\
#{body}"
  end
end

def redirect_response(uri)
  headers = DEFAULT_HEADERS.dup
  headers['Location'] = uri
  Response.new(302, 'See Other', headers, '')
end
