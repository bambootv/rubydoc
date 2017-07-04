# require thu vien json
require "json"

class A
  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    "In A:\n   #{@string}, #{@number}\n"
  end

  def to_json(*a)
    {
      "json_class" => self.class.name,
      "data" => {"string" => @string, "number" => @number}
    }.to_json(*a)
  end
end

# to_json: convert an object into a JSON string

a = A.new("hello world", 5)
json_string = a.to_json
puts json_string #=> {"json_class":"A","data":{"string":"hello world","number":5}}
puts JSON.parse(json_string) #=>{"json_class"=>"A", "data"=>{"string"=>"hello world", "number"=>5}}

# => dùng: có thể gửi dữ liệu nhiều chỗ và được chấp nhận bởi nhiều ứng dụng khác.
# => nếu cần lưu vào một file thì 1 đối tượng nó lưu trên 1 dòng, tiết kiệm diện tích
# => không dùng: Phải chắc chắn object có khả năng serialize dễ dàng. Vì chỉ có các hash, array, các kiểu dữ liệu nguyên thủy mới có thể dễ dàng chuyển đổi thành dạng json được

class B
  def initialize(number, a_object)
    @number = number
    @a_object = a_object
  end

  def to_s
    "In B: #{@number} \n  #{@a_object.to_s}\n"
  end


  def to_json(*b)
    {
      "json_class" => self.class.name,
      "data" => {"number" => @number, "a_object" => @a_object}
    }.to_json(*b)
  end
end

class C
  def initialize(a_object, b_object)
    @b_object = b_object
    @a_object = a_object
  end

  def to_s
    "In C: \n #{@a_object} #{@b_object}\n"
  end

  def to_json(*c)
    {
      "json_class" => self.class.name,
      "data" => {"a_object" => @a_object, "b_object" => @b_object}
    }.to_json(*c)
  end
end

c = C.new(A.new("hello world A", 5), B.new("hello world B", 5))
json_string = c.to_json
puts json_string
puts JSON.parse(json_string)

File.open((File.dirname(__FILE__) + '/file_json.json'), "w") do |file|
  (1..10).each do |index|
    a = A.new("hello world", index)
    file.puts a.to_json
  end
end

array = []
File.open((File.dirname(__FILE__) + '/file_json.json'), "r").each do |object|
  array << JSON.parse(object)
end

puts array
