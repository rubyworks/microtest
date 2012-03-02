# MicroTest

## Description

MicroTest is a minimal Test::Unit and MiniTest campatible 
test framework that runs on top of Ruby Test.

## Synopsis

MicroTests are written in the same manner as Ruby's standard
test framework(s).

```ruby
require 'microtest'
require 'microtest/assertions'  # for legacy assertion methods

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
```

For drop in compatability with Test::Unit, load `microtest/testunit`.

```ruby
require 'microtest/testunit'
require 'microtest/assertions'

class ExampleTest < Test::Unit::TestCase
  ...
end
```

## License

Copyright (c) 2011 Thomas Sawyer, Rubyworks

MicroTest is distributes under the terms of the **FreeBSD** license.

See License.txt for details.

