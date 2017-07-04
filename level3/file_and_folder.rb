1. File
class File là class con của class IO. IO là class basic cho tất cả input và output trong ruby.

<**> Opening and closing file

* Phương thức open và phương thức new
2 phương thức này đều được sử dụng để mở 1 file hoặc sẽ tạo ra file mới nếu file đó chưa tồn tại
cú pháp:
  File.new "tên file", "chế độ"
  File.open "tên file", "chế độ"

  VD: File.new "nghia.txt", "w+"

có các chế độ lựa chọn sau:
  r  - chỉ đọc, khi dùng chế độ này file bắt buộc phải tồn tại.
  r+ - chế độ vừa đọc vừa ghi, file bắt buộc phải tồn tại.
  w  - chỉ ghi, tạo ra 1 empty file.
  w+ - đọc và ghi, tạo ra 1 empty file.
  a  - append thêm nội dung vào file, tạo ra 1 file mới nếu file chưa tồn tại.
  a+ - đọc và append, tạo ra 1 file mới nếu file chưa tồn tại.

sự khác nhau giữa open và new:
open có thể đi kèm với 1 block còn new thì không

* Phương thức close để đóng file.
  f = File.open "nghia.txt", "r"
  f.close

<**> Reading and writing file

* Read file
để đọc từng dòng của file có 2 phương thức gets và readline

f = File.open "nghia.txt", "r"
f.gets
f.readline

2 phương thức read và readlines
read trả về 1 chuỗi
readlines trả về 1 mảng các dòng trong file
nếu file không tồn tại 2 phương thức này đều đưa ra error message.

f = File.open "nghia.txt", "w+"
f.read
f.readlines

hoặc
File.read "nghia.txt"
File.readlines "nghia.txt"

* Writing file
để ghi vào file có phương thức write và puts

Note: cả đọc và ghi file thì con trỏ cũng sẽ chạy lần lượt theo từng dòng 1 của file,
để đưa con trỏ về vị trí bắt đầu của file
dùng rewind

VD:
f = File.open "nghia.txt", "w+"
f.puts "edu"
f.write "framgia"
f.read # kết quả là "" do con trỏ đọc file đang ở cuối file nên nó k trỏ đến dòng nào.
f.rewind
f.read # kết quả sẽ là nội dung của file

<**> Renaming file
File.rename "tên hiện tại", "tên mới"
File.rename "nghia.txt", "nghia1.txt"

<**> Delete file
File.delete "tên file"
File.delete "nghia.txt"

<**> Một số phương thức khác
exist? => true hoặc false
kiểm tra file có tồn tại hay không
File.exist? "nghia.txt"

file? => true hoặc false
kiểm tra xem file có thực sự là file hay không
File.file? "nghia.txt"

directory? => true hoặc false
kiểm tra xem file có là một thư mục không
File.directory? "nghia.txt"

ftype => file hoặc directory
xem type của file
File.ftype "nghia.txt"

size? và size
xem size của file
size? trả về nil nếu tên file truyền vào là không tồn tại
size sẽ đưa ra 1 error message nếu file truyền vào là không tồn tại

ctime
xem thời gian create file
File.ctime "nghia.txt"

mtime
xem thời gian modify file
File.mtime "nghia.txt"

atime
xem thời gian cuối cùng access file
File.atime "nghia.txt"

2.Folder
<**> Tạo mới 1 folder
Dir.mkdir "folder name"

<**> Xóa 1 folder
Dir.delete "folder name"

<**> Mở folder
Dir.new "folder name"
Dir.open "folder name"

<**> Đóng 1 folder
close -> return nil

#xem tất cả các file trong 1 folder
Dir["folder name/*"] => return [] if folder name is invalid
Dir.entries "folder name" => show an error message if folder name is invalid

#tìm kiếm file trong folder
* match all file
character* match all file name beginning with charater
*character match all file name ending with character
*character* match all file have character in file name

Dir.glob "*"
Dir.glob "c*"
Dir.glob "*c"
Dir.glob "*cra*"
