# frozen_string_literal: true

require 'json'

if ARGV.length < 3
  puts 'Usage: query <column> <operator> <data>'
  exit 1
end

f = File.new('bird.json', 'r')
json = f.read
birds = JSON.parse(json)

column = ARGV[0]
operator = case ARGV[1]
           when '='
             ->(a, b) { a == b }
           when '<'
             ->(a, b) { a < b }
           when '>'
             ->(a, b) { a > b }
           else
             puts "Error: invalid operator #{ARGV[1]}"
             exit 2
           end
data = if ARGV[2] =~ /\d+/
         ARGV[2].to_i
       else
         ARGV[2]
       end

result = birds.select { |bird| operator.call(bird[column], data) }
output = { count: result.length, result: result }

File.open('out.json', 'w') do |file|
  file.write(JSON.pretty_generate(output))
end
