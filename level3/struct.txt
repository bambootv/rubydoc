Struct is a core Ruby class that generates other classes. These generated classes have accessor methods for the named fields you specify.
There are two ways to create a new class with

Struct.new("Point", :x, :y) # Creates new class Struct::Point
Point = Struct.new(:x, :y) # Creates new class, assigns to Point

p = Point.new(1,2) #<struct Point x=1, y=2>
p.x # => 1
p.y # => 2
p.x = 3 # => 3
p.x # => 3

- Define the [] and []= operators for array and hash-style indexing
p[:x] = 4 # => 4: same as p.x =
p[:x] # => 4: same as p.x
p[1] # => 2: same as p.y


- Provide each and each_pair iterators

Point = Struct.new(:x, :y)
p1 = Point.new(1,2)
p1.each {|c| print c} # prints "12"
p1.each_pair {|n,c| print n,c } # prints "x1y2"

#- (== operators) struct == other → true or false

p2 = Point.new(1,2)

p2==p1 #=> true

p2.x = 4
p1
#+ create a hash using p2 as a key
h = {p2=>1}
h[p1] = 1 #because p2==p1 #=> true

p1.to_s
p1.length #=> 2
p1.members #=> return all struct members as an array of symbols: [:x, :y]
p1.to_a[1] #=> 2
p1.to_h[:x] #=> 1

# values_at(selector, ...) → an_array
p1.values_at 0,1 #=> [1, 2]


#- add new method for class: 2 ways
#ex1: way 1

Point = Struct.new(:x, :y)
class Point

  def add!(other)
    self.x += other.x
    self.y += other.y
    self
  end

  def <=>(other) # Define the <=> operator
    self.x <=> other.x
  end
end

#ex2: way 2

Point = Struct.new(:x, :y) do

  def add!(other)
    self.x += other.x
    self.y += other.y
    self
  end

  def <=>(other) # Define the <=> operator
    self.x <=> other.x
  end
end

class Student
  def <=>(other)
    self.object_id <=> other.object_id
  end
end

p1= Point.new(Student.new, 1)
p2= Point.new(Student.new, 2)
p1 <=> p2 #=> -1
p2 <=> p1 #=> 1

p3= Point.new(Student.new, 1)
p1 <=> p3 #=> 0


#- undefine method for class
class Point
  undef x=, []
end

p1.x = 222 #=> error undefined method `x='
p1[:x] # undefined method `[]'

# should use because:
#=> it gives meaning to the data over an array or a hash
# the data is closely related
#ex with array
Với một mảng locations phía dưới ta không thể hiểu các con số nó là gì, nhưng với sử dụng struct mình sẽ biết được các con số nó thể hiện cho cái gì

locations = [[40.748817, -73.985428], [40.702565, 73.992537]]

Location = Struct.new(:longitude, :latitude)
location = Location.new(40.748817, -73.985428)

location.longitude #=> 40.748817

# with hash
# Struct will require specific attributes, whereas a Hash will accept anything

book = {}
book[:title]= "aa" #=> "aa"


p1= Point.new
p1[:title] = "aa" => no member in struct

# not use because:
# you need to know all of the attributes that you are defining
