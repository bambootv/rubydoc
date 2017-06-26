#### 1.Compare

Two strings are equal if they have the same length and content.

    "aa" == "ab" #=> true

    "aa" === "ab" #=> true

    "aa".eql?"ab" #=> true

-------------------------------------------

    "abcdef" <=> "abcde" #=> 1

    "abcdef" <=> "abcdef" #=> 0

    "abcdef" <=> "abcdefg" #=> -1

    "abcdef" <=> 1 #=> nil


#### 2.Sub String

Some function

    msg = "Ruby language"

    puts msg["Ruby"]

    puts msg["Python"]

    puts msg[0]

    puts msg[-1] => Kí tự cuối cùng.

    puts msg[0, 3]

    puts msg[0..9]

    puts msg[0, msg.length]

-------------------------------------------

    ruby = "Ruby"

    ruby.upcase

    ruby.downcase

    ruby.capitalize #=> Viết hoa chữ cái đầu

    ruby.swapcase #=> Hoa <-> thường

    ruby.start_with? "ruby"

    ruby.end_with? "ruby"

    "There are %.5f oranges and %d apples in the basket." % [12, 10]

    puts "%10d" % 1

    puts "%10d" % 12

    puts "%10d" % 123

    Truyền biến vào string #{name}
