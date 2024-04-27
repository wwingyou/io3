# frozen_string_literal: true

ControllerHandler = Struct.new(:http_method, :pattern, :handler_method)

# Controller base module
class Controller
  class NoHandlerError < RuntimeError; end

  @@handlers = []
  @@http_method = nil
  @@pattern = nil
  @@instance = nil

  def initialize(subclass)
    @@instance = subclass
  end

  def self.method_added(meth)
    super
    return if @@http_method.nil? || @@pattern.nil?
    @@handlers.push(ControllerHandler.new(@@http_method, @@pattern, meth))
    @@http_method = nil
    @@pattern = nil
  end

  def self.do_handler(http_method, uri, headers, body)
    @@handlers.each do |handler|
      if http_method == handler.http_method && (match = handler.pattern.match(uri))
        return @@instance.send(handler.handler_method, *match[1..], headers: headers, body: body)
      end
    end
    throw NoHandlerError
  end

  def self.get_mapping(pattern)
    @@http_method = 'GET'
    @@pattern = pattern
  end

  def self.post_mapping(pattern)
    @@http_method = 'POST'
    @@pattern = pattern
  end

  def self.put_mapping(pattern)
    @@http_method = 'PUT'
    @@pattern = pattern
  end

  def self.delete_mapping(pattern)
    @@http_method = 'DELETE'
    @@pattern = pattern
  end
end
