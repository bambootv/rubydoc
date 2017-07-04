### Methods

#### 1. Example

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

#### 2. Define

Methods implement the functionality of your program.

A method definition consists of the def keyword, a method name, the body of the method, return value and the end keyword.
When called the method will execute the body of the method.

#### 3. Return

If not return, the default returns the last statement.

#### 4 .Scope

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

#### 5 . Compare between function and method

a. Same

Quan trọng là Method hay Function là một tập hợp Code dùng để giải quyết một vấn đề cụ thể tùy thuộc đầu vào (input) và có thể trả về kết quả (output) tương ứng.
Điều này giúp việc lập trình dễ dàng hơn, cho phép sử dụng lại code cũng như thay đổi, năng cấp sản phẩm một cách hiệu quả.

b. Diffrent

1. About existence

```
Methods -> OOP (object orented programming)
Function -> FP (functional programming)
```

```
A method is on an object.
A function is independent of an object.
```

```
For Java, there are only methods, write in class.
For C, there are only functions, write anywhere.
For C++ it would depend on whether or not you're in a class
```

2. Call

A function is a piece of code that is called by name. It can be passed data to operate on (i.e. the parameters) and can optionally return data (the return value). All data that is passed to a function is explicitly passed.

A method is a piece of code that is called by a name that is associated with an object.
A object is an instance of a class.

A method is implicitly passed the object on which it was called.
A method is able to operate on data that is contained within the class (remembering that an object is an instance of a class - the class is the definition, the object is an instance of that data).
