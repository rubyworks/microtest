module MicroTest

  # Legacy Assertions
  #
  # This module provides a compatibility layer for Test::Unit/MiniTest.
  # This is an optional module and must be loaded on it's own.
  #
  # Note that two methods are not provided, +#assert_nothing_raised+,
  # and +#assert_nothing_thrown+.
  #
  module Assertions

    # Private method upon which all of the legacy assertions are based
    # (except for #assert itself).
    #
    # @raise [Assertion] If test fails.
    #
    # @return nothing
    def __assert__(test, msg=nil)
      msg = "failed assertion (no message given)" unless msg
      raise Assertion.new(msg, :backtrace=>caller[1..-1]) unless test
    end

    private :__assert__


    # The assertion upon which all other assertions are based.
    #
    # @example
    #   assert [1, 2].include?(5)
    #
    # @raise [Assertion] if `test` is true.
    def assert(test, msg=nil)
      msg = "failed assertion (no message given)" unless msg
      raise Assertion.new(msg, :backtrace=>caller) unless test
    end

    # The opposite of assert.
    #
    # @example
    #   assert [1, 2].include?(1)
    #
    # @raise [Assertion] if `test` is false.
    def refute(test, msg=nil)
      msg = "failed assertion (no message given)" unless msg
      raise Assertion.new(msg, :backtrace=>caller) if test
    end


    # Passes if the block yields true.
    #
    # @example
    #   assert_block "Couldn't do the thing" do
    #     do_the_thing
    #   end
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_block(msg=nil) # :yields:
      test = ! yield
      msg = "assertion failed" unless msg
      __assert__(test, msg)
    end

    # Passes if the block yields false.
    #
    # @example
    #   refute_block "Could do the thing" do
    #     do_the_thing
    #   end
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_block(msg=nil) # :yields:
      test = ! yield
      msg = "refutation failed" unless msg
      __assert__(!test, msg)
    end


    # Passes if expected equals actual (using #== operator).
    #
    # Note that the ordering of arguments is important,
    # since a helpful error message is generated when this
    # one fails that tells you the values of expected and actual.
    #
    # @example
    #   assert_equal 'MY STRING', 'my string'.upcase
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_equal(exp, act, msg=nil)
      test = (exp == act)
      msg  = "Expected #{act.inspect} to be equal to #{exp.inspect}" unless msg
      __assert__(test, msg)
    end

    # Passes if expected does not equal actual (using #== operator).
    #
    # @example
    #  refute_equal 'some string', 5
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_equal(exp, act, msg=nil)
      test = (exp == act)
      msg  = "Expected #{act.inspect} to not be equal to #{exp.inspect}" unless msg
      __assert__(!test, msg)
    end

    # Passes if expected does not equal actual (using #!= operator).
    #
    # @example
    #  assert_not_equal 'some string', 5
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_not_equal(exp, act, msg=nil)
      test = (exp != act)
      msg  = "Expected #{act.inspect} to not be equal to #{exp.inspect}" unless msg
      __assert__(test, msg)
    end


    # Passes if expected_float and actual_float are equal within delta tolerance.
    #
    # @example
    #   assert_in_delta 0.05, (50000.0 / 10**6), 0.00001
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_in_delta(exp, act, delta, msg=nil)
      test = (exp.to_f - act.to_f).abs <= delta.to_f
      msg  = "Expected #{exp} to be within #{delta} of #{act}" unless msg
      __assert__(test, msg)
    end

    # Passes if expected_float and actual_float are equal within delta tolerance.
    #
    # @example
    #   refute_in_delta 0.05, (50000.0 / 10**6), 0.01
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_in_delta(exp, act, delta, msg=nil)
      test = (exp.to_f - act.to_f).abs <= delta.to_f
      msg  = "Expected #{exp} to not be within #{delta} of #{act}" unless msg
      __assert__(!test, msg)
    end


    # Passes if object is an instance of a class.
    #
    # @example
    #   assert_instance_of String, 'foo'
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_instance_of(cls, obj, msg=nil)
      test = (cls === obj)
      msg  = "Expected #{obj} to be a #{cls}" unless msg
      __assert__(test, msg)
    end

    # Passes if object is not an instance of a class.
    #
    # @example
    #   refute_instance_of(String, :foo)
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_instance_of(cls, obj, msg=nil)
      test = (cls === obj)
      msg  = "Expected #{obj} to not be a #{cls}" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_instance_of, :refute_instance_of


    # Passes if object is a kind of a class.
    #
    # @example
    #   assert_kind_of Object, 'foo'
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_kind_of(cls, obj, msg=nil)
      test = obj.kind_of?(cls)
      msg  = "Expected #{obj.inspect} to be a kind of #{cls}" unless msg
      __assert__(test, msg)
    end

    # Passes if object is not a kind of a class.
    #
    # @example
    #   refute_kind_of(Numeric, 'foo')
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_kind_of(cls, obj, msg=nil)
      test = obj.kind_of?(cls)
      msg  = "Expected #{obj.inspect} to not be a kind of #{cls}" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_kind_of, :refute_kind_of


    # Passes if regexp matches a string (using `#=~`).
    #
    # @example
    #   assert_match(/\d+/, 'five, 6, seven')
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_match(exp, act, msg=nil)
      test = (act =~ exp)
      msg  = "Expected #{act.inspect} to match #{exp.inspect}" unless msg
      __assert__(test, msg)
    end

    # Passes if regexp does not match a string (using `#=~`).
    #
    # @example
    #   refute_match(/two/, 'one 2 three')
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_match(exp, act, msg=nil)
      test = (act =~ exp)
      msg  = "Expected #{act.inspect} to match #{exp.inspect}" unless msg
      __assert__(!test, msg)
    end

    # Passes if regexp does not match a string (using `#!~`).
    #
    # @example
    #   refute_match(/two/, 'one 2 three')
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_no_match(exp, act, msg=nil)
      test = (act !~ exp)
      msg  = "Expected #{act.inspect} to match #{exp.inspect}" unless msg
      __assert__(test, msg)
    end


    # Passes if object is nil.
    #
    # @example
    #   assert_nil [1, 2].uniq!
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_nil(obj, msg=nil)
      test = obj.nil?
      msg  = "Expected #{obj.inspect} to be nil" unless msg
      __assert__(test, msg)
    end

    # Passes if object is not nil.
    #
    # @example
    #   refute_nil [1, 2].first
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_nil(obj, msg=nil)
      test = obj.nil?
      msg  = "Expected #{obj.inspect} to not be nil" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_nil, :refute_nil


    # Compares the +object1+ with +object2+ using operator.
    #
    # Passes if object1.send(operator, object2) is true.
    #
    # @example
    #   assert_operator 5, :>=, 4
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_operator(o1, op, o2, msg="")
      test = o1.__send__(op, o2)
      msg = "Expected #{o1}.#{op}(#{o2}) to be true" unless msg
      __assert__(test, msg)
    end

    # Compares the +object1+ with +object2+ using operator.
    #
    # Passes if object1.send(operator, object2) is false.
    #
    # @example
    #   assert_operator 5, :>=, 4
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_operator(o1, op, o2, msg="")
      test = o1.__send__(op, o2)
      msg = "Expected #{o1}.#{op}(#{o2}) to be false" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_operator, :refute_operator


    # Passes if the block raises one of the given exceptions.
    #
    # @example
    #   assert_raise RuntimeError, LoadError do
    #     raise 'Boom!!!'
    #   end
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_raises(*args)
      msg = (Module === args.last ? nil : args.pop)
      begin
        yield
        msg = "Expected one of #{args.join(', ')} to be raised" unless msg
        __assert__(false, msg)
      rescue Exception => err
        test = args.any?{ |e| e === err }
        msg  = "Expected one of #{args.join(', ')} to be raised, but got #{err.class}" unless msg
        __assert__(test, msg)
        return err
      end
    end

    alias_method :assert_raise, :assert_raises

    # Provides a way to assert that a procedure
    # <i>does not</i> raise an exception.
    #
    # @example
    #   refute_raises(StandardError){ raise }
    #
    #def refute_raises(exception, &block)
    #  begin
    #    block.call(*a)
    #  rescue exception
    #    raise Assertion
    #  end
    #end

    #alias_method :assert_not_raises, :refute_raises


    # Passes if +object+ respond_to? +method+.
    #
    # @example
    #   assert_respond_to 'bugbear', :slice
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_respond_to(obj, meth, msg=nil)
      msg  = "Expected #{obj} (#{obj.class}) to respond to ##{meth}" unless msg
      #flip = (Symbol === obj) && ! (Symbol === meth) # HACK for specs
      #obj, meth = meth, obj if flip
      test = obj.respond_to?(meth)
      __assert__(test, msg)
    end

    # Passes if `object` does not respond to `method`.
    #
    # @example
    #   refute_respond_to 'bugbear', :slice
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_respond_to(obj, meth, msg=nil)
      msg  = "Expected #{obj} (#{obj.class}) to not respond to ##{meth}" unless msg
      #flip = (Symbol === obj) && ! (Symbol === meth) # HACK for specs
      #obj, meth = meth, obj if flip
      test = obj.respond_to?(meth)
      __assert__(!test, msg)
    end

    alias_method :assert_not_respond_to, :refute_respond_to


    # Passes if +actual+ .equal? +expected+ (i.e. they are the same instance).
    #
    # @example
    #   o = Object.new
    #   assert_same(o, o)
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_same(exp, act, msg=nil)
      msg  = "Expected #{act.inspect} to be the same as #{exp.inspect}" unless msg
      test = exp.equal?(act)
      __assert__(test, msg)
    end

    # Passes if ! actual .equal? expected (i.e. they are the same instance).
    #
    # @example
    #   refute_same Object.new, Object.new
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_same(exp, act, msg=nil)
      test = exp.equal?(act)
      msg  = "Expected #{act.inspect} to not be the same as #{exp.inspect}" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_same, :refute_same


    # Passes if the method send returns a true value.
    # The parameter +send_array+ is composed of:
    #
    # * A receiver
    # * A method
    # * Arguments to the method
    #
    # @example
    #   assert_send [[1, 2], :include?, 2]
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_send(send_array, msg=nil)
      r, m, *args = *send_array
      test = r.__send__(m, *args)
      msg  = "Expected #{r}.#{m}(*#{args.inspect}) to return true" unless msg
      __assert__(test, msg)
    end

    # Passes if the method send returns a true value.
    # The parameter +send_array+ is composed of:
    #
    # * A receiver
    # * A method
    # * Arguments to the method
    #
    # @example
    #   refute_send [[1, 2], :include?, 4]
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_send(send_array, msg=nil)
      r, m, *args = *send_array
      test = r.__send__(m, *args)
      msg  = "Expected #{r}.#{m}(*#{args.inspect}) to return false" unless msg
      __assert__(!test, msg)
    end

    alias_method :assert_not_send, :refute_send


    # Passes if the block throws expected symbol.
    #
    # @example
    #   assert_throws :done do
    #     throw :done
    #   end
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def assert_throws(sym, msg=nil)
      msg  = "Expected #{sym} to have been thrown" unless msg
      test = true
      catch(sym) do
        begin
          yield
        rescue ArgumentError => e     # 1.9 exception
          default += ", not #{e.message.split(/ /).last}"
        rescue NameError => e         # 1.8 exception
          default += ", not #{e.name.inspect}"
        end
        test = false
      end
      __assert__(test, msg)
    end

    # Passes if the block does not throw expected symbol.
    #
    # @example
    #   refute_throws :done do
    #     throw :another
    #   end
    #
    # @todo This implementation may well be incorrect.
    #
    # @raise [Assertion] if test fails
    #
    # @return nothing
    def refute_throws(sym, msg=nil)
      msg  = "Expected #{sym} to not have been thrown" unless msg
      test = true
      catch(sym) do
        begin
          yield
        rescue ArgumentError => e     # 1.9 exception
          default += ", not #{e.message.split(/ /).last}"
        rescue NameError => e         # 1.8 exception
          default += ", not #{e.name.inspect}"
        end
        test = false
      end
      __assert__(!test, msg)
    end


    # Flunk always fails.
    #
    # @example
    #   flunk 'Not done testing yet.'
    #
    # @raise [Assertion] always
    #
    # @return nothing
    def flunk(msg=nil)
      __assert__(false, msg)
    end

  end

  #
  class World
    include Assertions
  end

end
