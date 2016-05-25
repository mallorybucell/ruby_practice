require_relative 'caller_tools'

class MicroTest
  def self.inherited(c) # c is whatever class subclassed MicroTest
    c.class_eval do
      def self.method_added(m)
        if m =~ /^test/
          obj = self.new
          if self.instance_methods.include?(:setup)
            obj.setup
          end
          obj.send(m)
        end
      end
    end
  end

  def assert(assertion)
    if assertion
      puts "Assertion passed"
      true
    else
      puts "Assertion failed: "
      stack = CallerTools::Stack.new
      failure = stack.find { |call| call.meth != /assert/ }
      false
    end
  end

  def assert_equal(expected, actual)
    result = assert(expected == actual)
    puts "#{actual} is not #{expected}" unless result
    result
  end

end