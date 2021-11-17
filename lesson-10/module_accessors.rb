
module Accessors
 def attr_accessor_history(*args)
   args.each do |arg|
     variables_set_history = []
     var = "@#{arg}".to_sym
     define_method(arg) { instance_variable_get(var) }
     define_method("#{arg}=".to_sym) do |value|
       instance_variable_set(var, value)
       variables_set_history << value
     end
   define_method(("#{arg}" + '_' + 'history').to_sym) { variables_set_history.inspect }
   end
 end

 def strong_attr_accessor(attr_name, attr_class)
      var = "@#{attr_name}".to_sym
      define_method(attr_name) { instance_variable_get(var) }
      define_method("#{attr_name}=".to_sym) do |value|
        if value.class == attr_class
          instance_variable_set(var, value)
        else
          raise "TypeError"
        end
      end
  end
end

class Test
  extend Accessors
  attr_accessor_history :i, :j
  strong_attr_accessor :name, Integer
end
