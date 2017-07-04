# require thư viện yaml, xây dựng class A, B, C

require "yaml"

class A
  def initialize(string, number, example)
    @string = string
    @number = number
    @example = example
  end

  def to_s
    "In A:\n   #{@string}, #{@number}, #{@example}\n"
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
  def initialize(a_object, b_object)
    @a_object = a_object
    @b_object = b_object
  end

  def to_s
    "In C:\n #{@a_object} #{@b_object}\n"
  end
end

a = A.new("hello world", 5, "example")
b = B.new(7, a)
c = C.new(b, a)

puts c
# Tạo method to_s, => ta có thể nhìn thấy string đại diện cho cây object c ở phía dưới.

#In C:
# In A:
#   hello world, 5, example
# In B: 7
#  In A:
#   hello world, 5, example

#  Để có thể lưu chuỗi đại diện này vào file để khi cần ta có thể lôi nó ra và sử dụng thì ta cần serialize object tree này. Câu lệnh bên dưới
serialized_object = YAML::dump(c)
puts serialized_object

#b_object: !ruby/object:B
#  number: 7
#  a_object: &1 !ruby/object:A
#    string: hello world
#    number: 5
#a_object: *1

# Như bạn nhìn thấy thì khi serialize object c ra thì khi nhìn vào ta rất dễ đọc được.
# Nếu muốn lấy chúng lai ta dùng lệnh dưới đây
puts YAML::load(serialized_object)

#In C:
# In A:
#   hello world, 5, example
# In B: 7
#  In A:
#   hello world, 5, example

# Làm việc với file: Serialize một list các đối tượng vào ghi vào file file_yaml.yaml

File.open((File.dirname(__FILE__) + '/file_yaml.yaml'), "w") do |file|
  (1..10).each do |index|
  a = A.new("hello world A", index, "exampleA  #{index}")
  b = B.new(index, a)
    file.puts YAML::dump(C.new(a, b))
    file.puts ""
  end
end

# Deserialize các chuỗi dữ liệu được lưu trong file file_yaml.yaml để tạo ra array đối tượng đã được serialize
array = []
$/="\n\n" # mỗi đối tượng khi serialize ở trên ta lưu tối thiểu trên 2 dòng dữ liệu (File.puts) nên sử dụng biến này để phân định được các object với nhau
File.open((File.dirname(__FILE__) + '/file_yaml.yaml'), "r").each do |object|
  array << YAML::load(object)
end

puts array

