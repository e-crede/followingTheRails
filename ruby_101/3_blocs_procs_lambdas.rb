# Blocks
fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
doubled_fibs = fibs.collect {|i| i*2} # Collect applies a function call across every item in an array

# Yield - a way to execute blocks within methods
def tmp
    puts 1
    yield # block will be executed here
    puts 3
  end
tmp {puts 2}
# yield can be called with parameters as well
def tmp(num)
    yield(num) 
  end
tmp(33) {|i| puts i}

# Proc
# Blocks are not objects & cannot be saved to variables,
# though procs can. "Saved" block becomes a proc.
def greeter
    yield
end
phrase = Proc.new {puts "Hello there!"} # proc creation
greeter(&phrase) # call proc with parenthesis and an ampersand
phrase.call # to call proc directly

# To apply a method across an array it can be converted to a symbol and then passed as a proc
nums = [1, 2, 3]
strings = nums.collect(&:to_s)

# Lambdas are identical to procs with exeption of a few use cases
a = lambda { puts "Hello world" }
a.call

# > Lambda checks number of passed arguments to it (procs just assign nil in case of mismatch)

# > Lambda returns to calling method it allows method to finish & return its own value; proc returns immediately
def test_proc
    t = Proc.new { return "proc" }
    t.call
    "method"
end
  
puts test_proc # puts "proc"
  
def test_lambda
    t = lambda { return "lamba" }
    t.call
    "method"
end

puts test_lambda # puts "method"
