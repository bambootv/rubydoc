### Methods

#### 1.Example

    class Car
      attr_reader :name, :price
      attr_writer :name, :price
      # hoặc attr_accessor :name, :price

      def to_s
        "#{@name}: #{@price}"
      end

      def sefl.to_str
        "#{@name}: #{@price}"
      end

      def to_string
        return "#{@name}: #{@price}"
      end
    end

    c1 = Car.new
    c1.name = "Porsche"
    c1.price = 23500

#### 1.Define

Methods implement the functionality of your program.

A method definition consists of the def keyword, a method name, the body of the method, return value and the end keyword.
When called the method will execute the body of the method.

#### 2.Return

If not return, the default returns the last statement.

#### 3.Scope

  Instance method
    ```
    def to_s
      "#{@name}: #{@price}"
    end
    ```

  Class method
    ```
    class Car
      def sefl.to_str
        "#{@name}: #{@price}"
      end
    end
    ```
  To call class method, we call from ClassName, do not object. Example:
  ```
  Car.to_str #success

  car = Car.new
  car.to_str # error
  ```

  Phương thức initialize là phương thức khởi tạo.
  Phương thức này tự động được gọi khi chúng ta khai báo đối tượng.

  Phương thức attr_reader tạo ra phương thức getter
  Phương thức attr_writer tạo các phương thức setter.
  Phương thức attr_accessor sẽ tạo cả getter, setter.

  When Ruby encounters the def keyword, it doesn’t consider it an error if the method already exists: it simply redefines it. This is called overriding.

  ```
  "43".to_i
  => 43

  class String
    def to_i
      42
    end
  end
  => nil

  "43".to_i
  => 42
  ```
