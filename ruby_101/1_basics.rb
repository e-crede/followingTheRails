#
# Ruby basics from CodeCademy course
#

# Data types
my_num = 25 # implicit number size & type
my_boolean = true # no capitalisation
my_string = "Ruby"

# Basic Math
# [**] - exponent; [%] - modulo
i = ((1+2**3)/2)%3
puts i

# puts vs print
puts "ends with newline" # adds new line
print "no additional characters\n" # outputs original string

# Object oriented language, every object (e.g. numbers,strings etc.) has it's methods:
puts my_string.length
puts my_string.reverse
puts my_string.upcase
puts my_string.downcase


#here's a single line commend
=begin
here's a
multi line comment
=end

# Naming convention
local_variables_use_snake_case = "OK"


# Calling string methods w/o reassignment does not inherently update the local variable:
name = "AAAbbb"
name = name.downcase.reverse.upcase # name variable has to be updated to take into account the variables
puts name

# Though, adding an exclamation at the mark replaces the variable in-place
name.reverse!
puts name

# User input can be captured with gets.chomp method:
print "Enter something:"
answer = gets.chomp

# And printed out in strings with this syntax
puts "you entered #{answer}"

### Control Flow

# If Statement
if true
    puts true
  elsif false
    puts false
  else
    puts "are you running this on a quantum computer?"
  end

# Unless Statement, same as "if not"
hungry = false
unless hungry
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end

# Comparators
is_true = 2 != 3
is_false = 2 == 3
test_1 = 17 > 16
test_2 = 21 < 30
test_3 = 9 <= 9
test_4 = -11 < 4
# boolean operators
boolean_2 = true && 100 >= 100 # and
boolean_1 = 2**3 != 3**2 || true # or
boolean_3 = !(700 / 10 == 70) # not
# Combining operators is valid
boolean_2 = !true && (!true || 100 != 5**2)

# Methods with ? tend to evaluate to true/false and can be used in control flow
if "abcdef".include? "e"
    print "with e"
  end
# Methods for a partial string replace exists; gsub = global substitution
"Global Subsititution".gsub!(/s/,"th")

### Loops & Iterators

# while > executing while expression is "true"
i = 0
while i < 5
  puts i
  i = i + 1
end
# until > executing while expression "false"
until i == 5
  puts i
  i = i + 1
end

# Shortcut assignments exist: += and -= 
i+=1

# for
# 3 dots exclude last number from eval
for num in 1...10
    puts num
  end
# 2 dots include last number in eval
  for num in 1..15
    puts num
  end

# Loop iterator
# {} interchangeable with "do" keyword
  i = 20
loop do
  i -= 1
  next if i%2 == 1 # next skips an iteration
  print "#{i}"
  break if i <= 0
end

# Arrays can be iterated with each method
odds = [1,3,5,7,9]
odds.each do |i|
  print i*2
end

# times method - minimal for loop
10.times {puts "Hello World"}


### Data Structures

# Arrays can be accessed via indexes, index starts at 0
demo_array = [100, 200, 300, 400, 500]
print  demo_array[2]

# Arrays can consist of other arrays = multi dimensional arrays
multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
multi_d_array.each { |x| puts "#{x}\n" }

# Hash is a python dictionary
# Literal notation to create hash
my_hash = {
    "key" => "value"
}
# Alternative way to create hash
my_hash = Hash.new
my_hash["key"] = "value"

puts my_hash["key"]
my_hash.each {|x,y| puts "#{x} : #{y}"}


# Micro program - count frequency of words
puts "write words"
text = gets.chomp
words = text.split # split whitespace, create array
frequencies = Hash.new(0) # hash with default value of 0
words.each{ |word| frequencies[word]+=1} # increment every found word
frequencies = frequencies.sort_by {|word,freq| freq} # sort hash by frequencies
frequencies.reverse! # reverse order, so highest freq's appears first'
frequencies.each{|word,freq| puts "#{word} #{freq}"} # iterate through hash & print frequencies


# Methods
def greeting
    puts "Hello World"
end

# Splat arguments - arguments preceded with * can accept more arguments than defined in the code
def what_up(greeting, *friends)
    friends.each { |friend| puts "#{greeting}, #{friend}!" }
    return true
  end
  what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")

# Nameless methods are named Blocks (lambdas in python); {brackets} as well as do-end can be used for definitions
1.times { puts "As am I!" }


# Combined comparison operator <=> ; returns 0 if first operand equal to second, 1 if first operand is greater, -1 if first operand is less than a second one
"a" <=> "b" # useful when sorting string arrays - eg descending order

# nil - Ruby's None equivalent of python
i = nil

# Symbols
=begin
symbols - can be thought of as names, similar to strings but not same (not equal)
same :symbol would have have object_id through runtime, where'as if a "string" is defined several times and its object_id is called it be different
There's only a single copy of a symbol at a given time
=end

my_symbol = :symbol
:sym.to_s  # ==> "sym"
"sum".to_sym # ==> :sum (alternatively - .intern will also convert to symbol)

# Symbols are usually used as hash keys or for referencing methods
# Using Symbols is usually quicker than using strings in hashes (immutable + single copy of a symbol exists at a given time)
symbol_hash = {
    :one => 1,
    :two => 2,
    :three => 3,
  }

# rocket "=>" is an outdated assignment, new one is:
movies ={
    a: "val1",
    b: "val2"
  }

# Note - benchmark inbuilt capability
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]
symbol_time = Benchmark.realtime do
    100_000.times { symbol_AZ[:r] }
  end

# Inside hashes filtering can be also applied
movie_ratings = {
    memento: 3,
    primer: 3.5,
    the_matrix: 5,
    truman_show: 4,
    red_dawn: 1.5,
    skyfall: 4,
    alex_cross: 2,
    uhf: 1,
    lion_king: 3.5
  }
  good_movies = movie_ratings.select{|i,j| j > 3}
  puts movie_ratings.each_key {|i| puts i} # key's as well as values can be accessed independently
  puts movie_ratings.each_value {|i| puts i} 


# Case / switch statements -> Case statements use case / when / else keywords
movies = {bigBang: 1}

puts "Select Option"
choice = gets.chomp

case choice
when "add"
  puts "Title?"
  title = gets.chomp
  if movies[title.to_sym] == nil
    puts "Rating?"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "Added!"
  else
    puts "Movie already exists"
  end
when "update"
  puts "Title?"
  title = gets.chomp
  unless movies[title.to_sym] == nil
  puts "Rating?"
  rating = gets.chomp
  movies[title.to_sym] = rating.to_i
  puts "Rating Has been Updated!"
  else
  puts "Movie does not exist!"
  end
when "display"
  puts "Movies list:"
  movies.each{|i,j| puts "#{i}: #{j}"}
when "delete"
  puts "Title?"
  title = gets.chomp
  unless movies[title.to_sym] == nil
    movies.delete(title.to_sym)
    puts "Movie Deleted!"
  else
    puts "Movie not found"
  end
else
  puts "Error!"
end



