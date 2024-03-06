#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

regexp = /School/

matches = ARGV[0].scan(regexp)

if matches.empty?
  puts "No occurrences of 'School' found in the input."
else
  puts "Occurrences of 'School' found: #{matches.join(', ')}"
end
