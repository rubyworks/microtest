require 'microtest'
require 'microtest/assertions'

class ExampleTest < MicroTest::TestCase

  def setup
    @a = 1
  end

  def test_example_of_passing_test
    assert_equal(1, @a)
  end

  def test_another_example
    assert_kind_of(Integer, @a)
  end

end
