require "benchmark"
require "json"
require "yaml"

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

  def self.json_create(o)
    new(o["data"]["string"], o["data"]["number"])
  end
end


def benchmark_serialize(output_file)
  Benchmark.realtime do
    File.open(output_file, "w") do |file|
      (1..500000).each do |index|
        yield(file, A.new("hello world", index))
      end
    end
  end
end

puts "YAML:"
time = benchmark_serialize(File.dirname(__FILE__) + '/file_yaml.yaml') do |file, object|
  file.puts YAML::dump(object)
  file.puts ""
end
puts "Time: #{time} sec"

puts "JSON:"
time = benchmark_serialize(File.dirname(__FILE__) + '/file_json.json') do |file, object|
  file.puts object.to_json
end
puts "Time: #{time} sec"

puts "Marshal:"
time = benchmark_serialize(File.dirname(__FILE__) + '/file_marshal.marshal') do |file, object|
  file.print Marshal::dump(object)
  file.print "---_---"
end
puts "Time: #{time} sec"

#YAML:
#Time: 83.97426172799896 sec
#JSON:
#Time: 5.681611034000525 sec
#Marshal:
#Time: 3.419543687999976 sec

def benchmark_deserialize(input_file, array, input_separator)
  $/=input_separator
  Benchmark.realtime do
    File.open(input_file, "r").each do |object|
      array << yield(object)
    end
  end
end

# Deserialize
array1 = []
puts "YAML:"
time = benchmark_deserialize((File.dirname(__FILE__) + '/file_yaml.yaml'), array1, "\n\n") do |object|
  YAML::load(object)
end
puts "Array size: #{array1.length}"
puts "Time: #{time} sec"

array2 = []
puts "JSON:"
time = benchmark_deserialize((File.dirname(__FILE__) + '/file_json.json'), array2, "\n") do |object|
  JSON.parse(object)
end
puts "Array size: #{array2.length}"
puts "Time: #{time} sec"

array3 = []
puts "Marshal:"
time = benchmark_deserialize((File.dirname(__FILE__) + '/file_marshal.marshal'), array3, "---_---") do |object|
  Marshal::load(object.chomp)
end
puts "Array size: #{array3.length}"
puts "Time: #{time} sec"

#YAML:
#Array size: 500000
#Time: 62.48820704699938 sec
#JSON:
#Array size: 500000
#Time: 8.520103501999984 sec
#Marshal:
#Array size: 500000
#Time: 4.3925324869996984 sec

#Kết luận:
#Với dữ liệu lớn, không có như cầu đọc hiểu => sử dụng Mashal
#Với dữ liệu có nhu cầu đọc hiểu => sử dụng json nhưng phải thêm các phương thức tùy chỉnh cho từng đối tượng để có thể convert thành json
#Với dữ liệu nhỏ và cần đọc hiểu => sử dụng YAML
