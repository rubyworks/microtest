module MicroTest

  #
  # Output naturalized test names instead of just method names.
  # 
  def self.natural_names
    @natural_names ||= nil
  end

  #
  # Set flag to output naturalized test names instead of just method names.
  #
  def self.natural_names=(boolean)
    @natural_names = !!boolean
  end

  # The World serves as a base class in which the end-tester can
  # add univerally available test helpers for all test cases.
  class World
  end

  #
  class TestCase < World

    #
    # When the TestCase class is inherited, a new instance is 
    # automatically created.
    #
    def self.inherited(subclass)
      subclass.new
    end

    #
    # Create a new test and add it the the $TEST_SUITE global variable.
    #
    def self.new(*a,&b)
      $TEST_SUITE << super(*a,&b)
    end

    #
    # Returns name of testcase class.
    #
    def to_s
      self.class.name
    end

    #
    # Wrap test case run.
    #
    # @todo: Support setup-all and teardown-all in future ?
    #
    def call(&cont)
      #setup_all
      cont.call
      #teardown_all
    end

    #
    # Iterate over each test.
    #
    def each
      methods.each do |m|
        next unless m.to_s.start_with?('test_')
        yield(TestMethod.new(self, method(m)))
      end
    end

    #
    # No-op for test setup routine.
    #
    def setup
    end

    #
    # No-op for test teardown routine.
    #
    def teardown
    end

  end

  #
  # Encapsualtes test method for execution by RubyTest. Mainly
  # this separate encapsulation allows the test description to
  # be something other than just the method name, e.g. if the
  # `MicroTest.natural_names` flag is set to true.
  #
  class TestMethod
    def initialize(testcase, method)
      @testcase = testcase
      @method   = method
    end

    def call
      @testcase.setup
      @method.call
      @testcase.teardown
    end

    def to_s
      name = @method.name.to_s  
      name.gsub!('_', ' ') if MicroTest.natural_names
      return name
    end
  end

end
