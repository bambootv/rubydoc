class A
  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    "In A:\n   #{@string}, #{@number}\n"
  end
end

class B
  def initialize(number, a_object)
    @number = number
    @a_object = a_object
  end

  def to_s
    "In B: #{@number} \n  #{@a_object.to_s}\n"
  end
end

class C
  def initialize(b_object, a_object)
    @b_object = b_object
    @a_object = a_object
  end

  def to_s
    "In C: \n #{@a_object} #{@b_object}\n"
  end
end

a = A.new("hello world", 5)
b = B.new(7, a)
c = C.new(b, a)

#To serialize my object tree we simply do the following: Serialize một đối tượng
serialized_object = Marshal.dump(a)
puts serialized_object

# Nó có dạng mà ta không thể đọc hiểu được
#o:A:
#     @stringI"hello world:ET:
#                                @numberi

#If we now want to get it back
puts Marshal::load(serialized_object)

# Serialize một list các đối tượng và lưu nó vào file
File.open((File.dirname(__FILE__) + '/file_marshal.marshal'), "w") do |file|
  (1..100).each do |index|
    file.puts Marshal::dump(A.new("hello world #{index}", index))
    file.puts ""
  end
end

# Deserialize các chuỗi trong file thành các đối tượng trong array
array = []
$/="\n\n"
File.open((File.dirname(__FILE__) + '/file_marshal.marshal'), "r").each do |object|
  array << Marshal::load(object)
end

puts array

