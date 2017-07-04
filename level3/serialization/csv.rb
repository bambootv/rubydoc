require "csv"

csv_array = ["CSV", "data"].to_csv   # to CSV
csv_string = "CSV,String".parse_csv   # from CSV


# create string with format csv
csv_string = CSV.generate do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
  # ...
end

CSV.parse("CSV,data,String") do |row|
  # use row here...
  puts row[1]
end

# create file with format csv
CSV.open((File.dirname(__FILE__) + '/new_file.csv'), "wb") do |csv
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
  # ...
end


# Đọc tất cả dữ liệu trong file
vidu = CSV.read(File.dirname(__FILE__) + '/new_file.csv')
#[["row", "of", "CSV", "data"], ["another", "row"]]

customers = CSV.read(File.dirname(__FILE__) + '/customers.csv')

#[["Dan", "34", "2548", "Lovin it!"], ["Maria", "55", "5054", "Good, delicious food"], ["Carlos", "22", "4352", "I am \"pleased\", but could be better"], ["Stephany", "34", "6542", "I want bigger steaks!!!!!"]]


#đưa dữ liệu trong file ra theo từng hàng
CSV.foreach(File.dirname(__FILE__) + '/customers.csv') do |row|
  puts row.inspect
end

#["Dan", "34", "2548", "Lovin it!"]
#["Maria", "55", "5054", "Good, delicious food"]
#["Carlos", "22", "4352", "I am \"pleased\", but could be better"]
#["Stephany", "34", "6542", "I want bigger steaks!!!!!"]

#tạo file dữ liệu theo format csv từ file có dữ liệu trước
customers = CSV.read(File.dirname(__FILE__) + '/customers.csv')
CSV.open(File.dirname(__FILE__) + '/new-customers.csv', 'w') do |csv_object|
  customers.each do |row_array|
    csv_object << row_array
  end
end

# Nếu bạn có dữ liệu được phân tách bằng dấu phẩy dưới dạng một đối tượng String trong Ruby, bằng phương pháp CSV.parse có thể chuyển đổi sang dạng csv

a_string = "Dan,34\nMaria,55"
CSV.parse(a_string) #=> [["Dan", "34"], ["Maria", "55"]]

CSV.parse là dữ liệu từ một đối tượng chuỗi nào đó còn .read là từ một file nào đó trong ổ cứng của máy tính.

# Add thêm một cột vào file csv: average_money_spent

customers_array = CSV.read(File.dirname(__FILE__)  +'/new-customers.csv')
average_money_spent = Array.new
CSV.foreach(File.dirname(__FILE__)  +'/new-customers.csv', converters: :numeric) do |row|
  average_money_spent << row[2] / row[1]
end

customers_array.each do |customer|
 customer << average_money_spent.shift
end

CSV.open(File.dirname(__FILE__) + '/customers_add_col.csv', 'w') do |csv_object|
  customers_array.each do |row_array|
    csv_object << row_array
  end
end

# Tạo lớp A để tường minh hơn
class A
  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    "In A:\n   #{@string}, #{@number}\n"
  end

  def to_a
    ["#{@string}", "#{@number}"]
  end
end


a = A.new("hiha", 5)
a.to_a

CSV.open((File.dirname(__FILE__) + '/new_file_with_object.csv'), "wb") do |csv|
  (1..10).each do |index|
    a = A.new("hello world", index)
    csv << a.to_a
  end
end

list_object = []
CSV.foreach(File.dirname(__FILE__) + '/new_file_with_object.csv') do |row|
  list_object.push(A.new(row[0], row[1]))
end

puts list_object
