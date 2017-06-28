Hash là một kiểu dữ liệu lưu trữ theo dạng tập hợp giống như mảng
mỗi phần tử gồm 2 thành phần: key và value.

1. Khởi tạo:
dùng phương thức new của lớp Hash
a = Hash.new
a[:name] = "abc"
a[:age] = 20

hoặc dùng phương thức new với giá trị default
a = Hash.new(0)
a[:name] = "abc"
a[:age] = 20

hoặc khởi tạo với key và value
a = {name: "abc", age: 20}

nếu không khai báo, default value mặc định là nil. Nên khi truy cập hash với invalid key sẽ trả về nil.
nếu khởi tại hash với default value được truyền vào thì khi truy cập hash với invalid key sẽ trả về giá trị default.

a = Hash.new
a[:name] = "abc" => a[:namee] -> nil

a= Hash.new(10)
a[:name] = "abc" => a[:namee] -> 10

2. Một số thao tác với Hash

#each, each_key, each_value
a = {name: "abc", age: 20}

each duyệt qua tất cả key và value
a.each{|k,v| puts k, v}

each_key duyệt qua tất cả các key của hash
a.each_key {|k| puts k}

each_value duyệt qua tất cả các value của hash
a.each_value {|v| puts v}

#delete, delete_if, shift

shift xóa phần tử đầu tiên của hash
a = {name: "abc", age: 20}
a.shift
a = {:age=>20}

delete xóa phần tử có key được chỉ định
a = {name: "abc", age: 20}
a.delete :age
a = {:name=>"abc"}

delete_if xóa phần tử thỏa mãn điều kiện
a = {name: "abc", age: 20}
a.delete_if {}
a = {:name=>"abc"}


#GỘP HASH
merge, merge! update
merge! và update tạo ra 1 hash mới và thay đổi giá trị của hash ban đầu
merge tạo ra hash mới nhưng k thay đổi giá trị hash ban đầu

a = {name: "abc"}
b = {age: 20}

a.merge b
-> {:name=>"abc", :age=>20}
a
-> {:name=>"abc"}
a.update b hoặc a.merge! b
-> {:name=>"abc", :age=>20}
a
-> {:name=>"abc", :age=>20}

#any? empty?
trả về true hoặc false, any? kiểm tra xem có phần tử nào trong hash không, empty? kiểm tra xe hash rỗng hay không

a = {name: "abc", age: 20}
a.any?
-> true
a.any? {|k,v| v == 20}
-> true
a.empty?
-> false

#has_key? has_value? include?
has_key?(key) kiểm tra hash có key đó không, trả về true hoặc false
has_value?(value) kiểm tra hash có value đó không, trả về true hoặc false
include?(key) giống như has_key?

#reject và reject!
loại bỏ phần tử ra khỏi hash nếu thỏa mãn đk
a.reject{|k,v| v == 20}

reject! làm thay đổi giá trị của hash ban đầu

#length
length: trả về số các phần tử trong hash (số cặp key, value)

a = {name: "abc", age: 20}
a.length => 2

#keys, values
Lấy ra tất cả các key hoặc tất cả các value

a = {name: "abc", age: 20}
a.keys
-> [:name, :age]
a.values
-> ["abc", 20]

