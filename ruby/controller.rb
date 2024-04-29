# frozen_string_literal: true

ControllerHandler = Struct.new(:http_method, :pattern, :handler_method)

# Controller base module
class Controller
  class NoHandlerError < RuntimeError; end

  def initialize
    super
    self.class.register_instance self
  end

  class << self
    def register_instance(instance)
      @instance = instance
    end

    def method_added(meth)
      super
      return if @http_method.nil? || @pattern.nil?

      @handlers ||= []
      @handlers.push(ControllerHandler.new(@http_method, @pattern, meth))
      @http_method = nil
      @pattern = nil
    end

    def do_handler(http_method, uri, headers, body)
      @handlers.each do |handler|
        if http_method == handler.http_method && (match = handler.pattern.match(uri))
          return @instance.send(handler.handler_method, *match[1..], headers: headers, body: body)
        end
      end
      throw NoHandlerError
    end

    def get_mapping(pattern)
      @http_method = 'GET'
      @pattern = pattern
    end

    def post_mapping(pattern)
      @http_method = 'POST'
      @pattern = pattern
    end

    def put_mapping(pattern)
      @http_method = 'PUT'
      @pattern = pattern
    end

    def delete_mapping(pattern)
      @http_method = 'DELETE'
      @pattern = pattern
    end
  end
end
