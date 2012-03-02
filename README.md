# MicroTest

## Description

MicroTest is a minimal Test::Unit and MiniTest compatible 
test framework that runs on top of Ruby Test.

## Synopsis

Tests are written in the same manner as they are for Ruby's
traditional test framework(s). The only significant difference
is that an assertions framework library needs to be required
along with the test library itself. MicroTest comes with a 
traditional assertions system for backward compatability
with TestUnit and MiniTest. Simply require `microtest/assertion`
to get it. Alternatively any BRASS compliant assertion framework
can be used.

```ruby
require 'microtest'
require 'microtest/assertions'

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

For drop in compatibility with Test::Unit, load `microtest/testunit`.

```ruby
require 'microtest/testunit'
require 'microtest/assertions'

class ExampleTest < Test::Unit::TestCase
  ...
end
```

## License

Copyright (c) 2011 Rubyworks

MicroTest is distributes under the terms of the **FreeBSD** license.

See License.txt for details.

