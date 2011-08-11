module MicroTest

  #
  def self.natural_names
    @natural_names ||= nil
  end

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

    def self.inherited(subclass)
      subclass.new
    end

    #
    def self.new(*a,&b)
      $TEST_SUITE << super(*a,&b)
    end

    #
    def to_s
      self.class.name
    end

    #
    def call(&cont)
      setup
      cont.call
      teardown
    end

    #
    def each
      methods.each do |m|
        next unless m.to_s.start_with?('test_')
        yield(TestMethod.new(method(m)))
      end
    end

    #
    def setup
    end

    #
    def teardown
    end

  end

  #
  class TestMethod
    def initialize(method)
      @method = method
    end

    def call
      @method.call
    end

    def to_s
      name = @method.name.to_s  
      name.gsub!('_', ' ') if MicroTest.natural_names
      return name
    end
  end

end
