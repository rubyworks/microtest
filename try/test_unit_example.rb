require 'microtest/unit'
require 'microtest/assertions'

class ExampleTest < Test::Unit::TestCase

  def setup
    @a = 1
  end

  def test_example_of_passing_test
    assert_equal(1, @a)
  end

end

