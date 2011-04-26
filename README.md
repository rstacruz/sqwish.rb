# Sqwish-ruby
#### A CSS compressor

This as a Ruby bridge to [Sqwish](https://github.com/ded/sqwish) by Dustin 
Diaz. Just install it:

    $ gem install sqwish

And use it like so:

    require 'sqwish'
    Sqwish.minify "div { color: red; } div { background: black; }"
    #=> "div{color:red;background:black}"

You can also use the `strict: false` flag (it defaults to true):

    Sqwish.minify "div { color: red; } div { background: black; }", strict: false
    #=> "div{color:red}div{background:black}"

## Authors

 * **Sqwish** is by Dustin Diaz @ [github.com/ded/sqwish](https://github.com/ded/sqwish).
 * This Ruby gem is by Rico Sta. Cruz @ [github.com/rstacruz/sqwish.rb](http://github.com/rstacruz/sqwish.rb).

Released under the MIT license.
