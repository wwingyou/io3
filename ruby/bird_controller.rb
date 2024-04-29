# frozen_string_literal: true

require './controller'
require './response.rb'

# Bird controller
class BirdController < Controller
  def initialize
    super
    @birds = []
  end

  get_mapping(%r{^/bird$})
  def birds_list(**_)
    @birds.join(', ')
  end

  post_mapping(%r{^/bird$})
  def add_bird(body:, **_)
    @birds.push(body)
    redirect_response "/bird/#{@birds.length}"
  end

  get_mapping(%r{^/bird/(\d+)$})
  def bird_at(id, **_)
    "#{id} - #{@birds[id.to_i - 1]}"
  end

  put_mapping(%r{^/bird/(\d+)$})
  def chage_bird(id, body:, **_)
    @birds[id.to_i - 1] = body
    redirect_response "/bird/#{@birds.length}"
  end

  delete_mapping(%r{^/bird/(\d+)$})
  def delete_bird(id, **_)
    @birds.delete_at(id.to_i - 1)
    redirect_response '/bird'
  end
end
