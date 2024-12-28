#!/usr/bin/env ruby
# frozen_string_literal: true

require 'artii'
require 'optparse'

artii = Artii::Base.new :font => 'slant'

new_year = ARGV.join.to_i
last_year = new_year -1

output_year = artii.asciify(new_year -1)

lines = output_year.split("\n")
height = lines.size
width = lines[0].size


display_lines = Array.new(height, " " * width)

width.times do |step|
  height.times do |i|
    display_lines[i] = " " * (width - step -1) + lines[i][0..step]
  end
  puts "\e[H\e[2J"
  display_lines.each{ |line| puts line}
  sleep(0.1)
end


# 最終状態を表示
puts "\e[H\e[2J"
lines.each { |line| puts line }
