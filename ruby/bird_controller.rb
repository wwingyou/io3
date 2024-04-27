# frozen_string_literal: true

require './controller'

# Bird controller
class BirdController < Controller
  def initialize
    super self
    @birds = []
  end

  get_mapping(%r{^/bird$})
  def birds_list(**_)
    @birds.join(', ')
  end

  post_mapping(%r{^/bird$})
  def add_bird(body:, **_)
    @birds.push(body)
    @birds.length.to_s
  end

  get_mapping(%r{^/bird/(\d+)$})
  def bird_at(id, **_)
    "#{id} - #{@birds[id.to_i - 1]}"
  end

  put_mapping(%r{^/bird/(\d+)$})
  def chage_bird(id, body:, **_)
    @birds[id.to_i - 1] = body
  end

  delete_mapping(%r{^/bird/(\d+)$})
  def delete_bird(id, **_)
    @birds.delete_at(id.to_i - 1)
  end
end
