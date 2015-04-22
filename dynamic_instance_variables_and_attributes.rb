The GenericEntity class should allow any hash to be passed to its initializer which then creates instance variables and matching attribute readers for each key/value pair in the hash:

box = GenericEntity.new(:shape => "square", :material => "cardboard")
#box now has instance variables @shape and @material and attribute readers for both
box.material #=> "cardboard"
Make sure that attributes created in prior calls to the initializer are not still defined in subsequent instances of GenericEntity unless they appear in both hashes passed to the initializer.

box = GenericEntity.new(:shape => "square", :material => "cardboard", :volume => 3.2)
tree = GenericEntity.new(:material => "organic", :age => 52)
tree.volume #volume attribute should not exist

#Solution:

# Make sure that attributes created in prior calls to the initializer 
# are not still defined in subsequent instances of GenericEntity 
# unless they appear in both hashes passed to the initializer.
#
class GenericEntity
  def initialize(opts={})
    # Turn hash into instance variables
    opts.each { |k,v| instance_variable_set("@#{k}".to_sym, v) }
  end
  
  # Add an @ to the beginning of the sent method
  # Check for inclusion of the given instance variable and return value
  # If method is not an instance variable, then refer to the Object method_missing
  def method_missing(method_sym, *arguments, &block)
    method_sym = "@#{method_sym.to_s}".to_sym
    if instance_variables.include? method_sym
      instance_variable_get method_sym
    else
      super
    end
  end
end

#alternative solution

class GenericEntity
  def initialize(attrs = {})
    attrs.each do |attr, value|
      define_singleton_method(attr) { instance_variable_get("@#{attr}") }
      instance_variable_set("@#{attr}", value)
    end
  end
end

#Test cases:

car = GenericEntity.new(:color => "black", :engine => "V8")

Test.assert_equals(car.color, "black")

