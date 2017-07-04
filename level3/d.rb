require 'byebug'


module Mod
  # def a
  # 	puts "a"
  # end
  def b 
  	puts "b"
  end
  private
  def d 
  	puts "d"
  end
  # private :d
end
# module B
# 	include Mod
# 	def f
# 		a()
# 	end
# end
class C
	include Mod
	def c
		byebug
	end

	def total x
		# byebug
		puts d
		puts self.d
		puts x.d
	end
end
c=C.new
byebug
puts "5"

module M
	def hello
		:hello
	end
end

# wtf?
include M

# wtf?
public
def goodbye
	:goodbye
end
method(:include).owner #=> #<Class:#<Object:0xb0f0b8>>
method(:public).owner #=> #<Class:#<Object:0xb0f0b8>>
