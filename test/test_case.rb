class ExampleTest < MicroTest::TestCase

  #
  def setup
    @a = 1
  end

  #
  def test_alpha_is_one
    assert_equal(1, @a)
  end

end

