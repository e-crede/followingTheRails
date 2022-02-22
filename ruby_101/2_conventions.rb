# Single line if/unless statements (something to do if <boolean>)
puts "It's true" if true
puts "It's false" unless false

# Ternary conditional expression:
puts 2 < 5 ? "is less" : "is more" # boolean ? Do this if true: Do this if false

# Cases can also be written in single lines
case language
when "Ruby" then puts "Web apps!"
else puts "I don't know!"
end

# Conditional assignment - assign a value only if it hasn't been assigned
my_var = nil
my_var ||= 1 # my_var gets set to 1
my_var ||= 2 # my_var stays 1
my_var = nil # my_vars is set to nil

# Implicit return - methods return last evaluated expression
def sum(a,b)
    a + b   # identical to return a + b
end

# Short-circuit evaluation
false || true # both expressions are evaluated
false && true # only leftmost expression is evaluated, as there's no need to evaluate the other side

# "for" loop alternatives - each & times
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
my_array.each {|x| puts x if x % 2 == 0} # print even numbers only
5.times {"Hello World"}

# .upto .downto can be used to iterate through a known list of numbers
"L".upto("P") {|i| puts i}

# Checking if a variable has a method
age = 26
age.respond_to?(:next) # returns true, as an integer has a method next

# Concatenation Operator - Shovel
[1,2] << 3 # same as [1,2].push(3)

# String interpolation
num = 5
"five is #{num}"  # same as "five is " + num.to_s
