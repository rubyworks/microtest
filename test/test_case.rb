class ExampleTest < MicroTest::TestCase

  #
  def setup
    @a = 1
  end

  #
  def test_alpha
    assert_equal(1, @a)
    @a = 2
  end

  #
  def test_alpha_again
    assert_equal(1, @a)
    @a = 2
  end

end

