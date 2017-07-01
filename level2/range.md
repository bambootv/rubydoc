### Range

A Range represents an interval—a set of values with a beginning and an end

Ranges can be constructed using any objects that can be compared using the <=> operator

1. Public Class Methods

```
a = Range.new(begin,end,exclude_end=false)

a = Range.new(1,4) #=> [1, 2, 3, 4]

If exclude_end=false, result include end
```

2. Public Instance Methods

```
(-1..-5).to_a      #=> []
(-5..-1).to_a      #=> [-5, -4, -3, -2, -1]
('a'..'e').to_a    #=> ["a", "b", "c", "d", "e"]
('a'...'e').to_a   #=> ["a", "b", "c", "d"]
```

```
(1..5).each do |i|
  puts "#{i}, "
end
```

```
(0..2) == (0..2)            #=> true
(0..2) == Range.new(0,2)    #=> true
(0..2) == (0...2)           #=> false [0,1,2] # [0,1]
```

```
case 79
when 1..50   then   print "low\n"
when 51..75  then   print "medium\n"
when 76..100 then   print "high\n"
end # => high
```

```
(1..10).begin   #=> 1
range = [2, 3, 4, 5, 6, 7]
range.min #2
range.max #7
range.include? 3 # true
range.include? 10 # false
include?(obj) → true or false
("a".."z").include?("g")   #=> true
("a".."z").include?("A")   #=> false
("a".."z").include?("cc")  #=> false
last(n) → an_array
a.last(2) #=> [3, 4]
a.size => 4
```
