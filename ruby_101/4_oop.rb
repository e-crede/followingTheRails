# Objects Oriented Programming

# Class syntax
class SomePerson # names are CamelCase
    def initialize(name)
      @name = name # @name is an instance variable
    end
  end

# Calling class with a "new" method creates an object
x = SomePerson.new("Alan")

# Variables scope
# @instance_var -> variables unique for every object created by a class
# @@class_var -> variables shared across the same class
# $global_var -> global var
$global_var = false
class Greeter
    @@people_greeted = 0
    def initialize(name)
        @name = name
    end
    def greet
        puts "Hello #{@name}"
        @@people_greeted+=1
    end
    def count
        puts "Greeted: #{@@people_greeted}"
    end
end

tom = Greeter.new("Tom Toodler")
peter = Greeter.new("Peter Parker")
tom.greet
peter.greet
tom.count

# Inheritance - a class takes on attributtes of a parent class
class Welcomer < Greeter
    def greet # methods can be overwritten
        puts "Welcome #{@name}"
        @@people_greeted+=1
    end
end
adam = Welcomer.new("Adam Aldoran")
adam.greet
adam.count # class variables and their values also inherited!

class AnotherOne < Greeter
    def greet
        puts "You again?"
        super # calls parent classes method
    end
end

# Any given class can only have a single inherited superclass -> no multiple-inheritance is allowed
# Below sample is invalid code

=begin
class SomeClass < Greeter
end
class SomeClass < SomePerson
end
=end

# Class methods are public by default
# public methods within a class allow method to be called outside of the class
# private methods within a class allow methods to be called only within the class
class Dog
    def initialize(name, breed)
      @name = name
      @breed = breed
    end
    public
    def bark
      puts "Woof!"
    end
    private
    def id
      @id_number = 12345
    end
  end

# attr_reader and attr_writer
# instead of writing additional methods to access instance variables,
# attr_reader / attr_writer can be used instead
class SomePerson
    def initialize(name, job)
      @name = name
      @job = job
    end
    attr_reader :name
    attr_reader :job
    attr_writer :job
  end

# attr_accessor combines reader&writer
class SomePerson
    def initialize(name, job)
      @name = name
      @job = job
    end
    attr_reader :name
    attr_accessor :job
  end


# Modules
# Modules are like micro-libraries to store commonly used methods
module SomeConstants
    THE_ANSWER = 42 # Constants are written in all caps
    def answer
        return THE_ANSWER
    end
end

# Namespacing
# One of the main purpose of modules is to separate constants into named spaces
# to select right constants scope resolution operator is used -> ::
puts Math::PI

# To load non-default modules "require" keyword is used
require 'date'
puts Date.today

# Instead of loading modules, they can be just included within the classes
# when a module is used within a class it is called mixin
class Circle
    include Math # constants & methods within Math will be accessible for this class
    def initialize
      puts PI # no namespacing required
    end
end

# To make module methods available at the class level "extend" can be used
class YetAnother
    extend SomeConstants
end
puts YetAnother.answer
