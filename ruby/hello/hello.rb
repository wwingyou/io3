# frozen_string_literal: true

name = if ARGV[0].nil?
         print 'Tell me your name: '
         gets
       else
         ARGV[0]
       end

puts "Hello #{name}"
