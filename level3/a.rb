

require 'byebug'

byebug
begin
	raise "123123"
rescue => e
	byebug
	puts "9"
end

