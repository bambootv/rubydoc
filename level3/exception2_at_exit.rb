require 'byebug'

# puts "start"
# at_exit do
#   puts "inside at_exit"
# end
# puts "end"


puts "start"
at_exit do
  puts "inside at_exit"
  exit 7
end
puts "end"
byebug
exit 0