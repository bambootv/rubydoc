Ruby có tổng cộng 5 loại biến:
- Biến local
- Biến global
- Biến instance
- Biến class
- Biến constant

1.LOCAL VARIABLE
phạm vi sử dụng phụ thuộc vào vị trí khai báo biến 
a = "abc"

def local
  puts a = "local variable"
end

#irb
a > "abc"
local > local variable
a > "abc"

Ta thấy mặc dù đều là biến a nhưng biến a trong phương thức và biến a ngoài phương thức là 2 biến hoàn toàn khác nhau.
và biến a trong phương thức là biến local và không thể gọi ở bên ngoài phương thức được.

2.GLOBAL VARIABLE
được khai báo bắt đầu bằng kí tự "$", phạm vi sử dụng là trong toàn chương trình,
biến này có thể được sử dụng và được chỉnh sửa ở mọi chỗ.

$a = "abc"

def global
 puts $a = "global variable"
end

#irb
$a > "abc"
global > global varibale
$a > "global variable"

Ta thấy, khi giá trị của biến global thay đổi ở trong phương thức, thì sự thay đổi này ảnh hưởng ra tới bên ngoài phương thức.
Chính vì việc có thể thay đổi ở mọi nơi nên biến global được khuyến khích không nên sử dụng, khó debug.
Như vậy, phạm vi của biến global là toàn bộ chương trình.

3.INSTANCE VARIABLE
là biến đối tượng, được khai báo bắt đầu bằng kí tự "@".
nó thuộc về đối tượng riêng lẻ của 1 lớp hoặc 1 đối tượng của 1 lớp
class Test
  @name = "nghia"
  class << self
    def show1
      @name
    end
  end

  def change
    @name = "nghiantt"
  end

  def show2
    @name
  end
end

#irb
Test.show1 > "nghia"
t = Test.new
t.change > "nghiantt"
t.show2 > "nghiantt"
Test.show1 > "nghia"

biến @name khai báo sau class Test là biến instance của class
biến @name khai báo trong phương thức là biến instance của object
ở ví dụ trên ta thấy:
biến instance @name của class không bị thay đổi sau khi thực hiện phương thức change của đối tượng t.
=> instance variable chỉ thuộc riêng lẻ cho mỗi đối tượng và phạm vi sử dụng của nó là toàn bộ trong một lớp.

4.CLASS VARIABLE
biến class được khai báo với kí tự "@@", khác với instance variable, biến class được dùng chung cho tất các các đối tượng của
lớp đó.
class Test
  @@name = "nghia"
  class << self
    def show
      @@name
    end
  end

  def change
    @@name = "nghiantt"
  end

  def show
    @@name
  end
end

#irb
Test.show1 > "nghia"
t = Test.new
t.change > "nghiantt"
t.show2 > "nghiantt"
Test.show1 > "nghiantt"

ở ví dụ trên ta thấy:
biến instance @name của class không đã thay đổi sau khi thực hiện phương thức change của đối tượng t.
=> class variable được dùng chung cho tất các các đối tượng của lớp.


5. CONSTANR VARIABLE
Mặc định những var được khai báo với tên bắt đầu bằng chữ in hoa là constant variable.
giá trị của constant không đổi trong quá trình chương trình chạy.
Trình thông dịch của Ruby không bắt buộc về sự cố định giá trị của Constant, nhưng nếu có sự thay đổi giá trị của Constant
thì trình thông dịch sẽ có thông báo về sự thay đổi đó.

A = 1
A = 2

=> warning: already initialized constant A
   warning: previous definition of A was here

Green = "green"
Green = "pink"

=> warning: already initialized constant Green
   warning: previous definition of Green was here





