module A
	def a
		puts "a"
	end
end

module B
	def b
		puts "b"
	end
end

class C
	extend A
	include B

end

c=C.new
b.a
c.b
