# MicroTest

[![Gem Version](https://badge.fury.io/rb/microtest.png)](http://badge.fury.io/rb/microtest)
[![Build Status](https://secure.travis-ci.org/rubyworks/microtest.png)](http://travis-ci.org/rubyworks/microtest) &nbsp; &nbsp;
[![Flattr Me](http://api.flattr.com/button/flattr-badge-large.png)](http://flattr.com/thing/324911/Rubyworks-Ruby-Development-Fund)

[Website](http://rubyworks.github.com/microtest) &middot;
[API](http://rubydoc.info/gems/microtest) &middot;
[Report Issue](http://github.com/rubyworks/microtest/issues) &middot;
[Source Code](http://github.com/rubyworks/microtest)


## Description

MicroTest is a minimal Test::Unit and MiniTest compatible 
test framework that runs on top of Ruby Test.


## Installation

Using Rubygems:

    $ gem install microtest


## Instruction

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

To run tests use the `rubytest` command line utility.


    $ rubytest -Ilib test/test_example.rb


See [RubyTest](http://rubyworks.github.com/rubytest) for more details on this.


## License

Copyright (c) 2011 Rubyworks

MicroTest is distributes under the terms of the **FreeBSD** license.

See License.txt for details.

