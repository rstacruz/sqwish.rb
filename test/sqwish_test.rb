require 'test/unit'
require File.expand_path('../../lib/sqwish.rb', __FILE__)

class SqwishTest < Test::Unit::TestCase
  def setup
    @src = "" +
      "div { color: orange; background: red; }" +
      "div { color: #ff33cc; margin: 1px 0px 1px 0px; }"
  end

  def test_unstrict
    output = Sqwish.minify @src, strict: false
    assert_equal "div{color:orange;background:red}div{color:#f3c;margin:1px 0}", output
  end

  def test_strict
    output = Sqwish.minify @src, strict: true
    assert_equal "div{margin:1px 0;color:#f3c;background:red}", output
  end
end
