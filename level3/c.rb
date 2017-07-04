require 'byebug'


# module A
#   def a 
#   	puts "a"
#   end
# end

# module B
# 	# include A
#   def b
#   	# byebug
#   	puts B
#   end
# end



module A
  refine Object do
  end
end

module B
  refine Object do
  end
end

using A
using B



# class C
# 	include B

# end


using A
using B
byebug
puts Module.used_modules
# c = C.new
# c.b
