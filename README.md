# Sqwish-ruby
#### A CSS compressor

This as a Ruby bridge to [Sqwish](https://github.com/ded/sqwish) by Dustin Diaz
to compress CSS very efficiently.

### Ruby usage

Just install it:

    $ gem install sqwish

Then use it like so:

``` ruby
require 'sqwish'

Sqwish.minify "div { color: red; } div { background: black; }"
#=> "div{color:red}div{background:black}"
````

You can also use the `strict: true` flag (it defaults to false):

  ``` ruby
Sqwish.minify "div { color: red; } div { background: black; }", strict: true
#=> "div{color:red;background:black}"
```

## Rails usage

In your Gemfile:

``` ruby
gem 'sqwish'

# or optionally:
gem 'sqwish', github: 'rstacruz/sqwish.rb'
```

In your `config/environments/production.rb`:

``` ruby
config.assets.css_compressor = Sqwish

# or use strict mode:
config.assets.css_compressor = Sqwish::Strict
```

## Authors

 * **Sqwish** is by Dustin Diaz @ [github.com/ded/sqwish](https://github.com/ded/sqwish).
 * This Ruby gem is by Rico Sta. Cruz @ [github.com/rstacruz/sqwish.rb](http://github.com/rstacruz/sqwish.rb).

Released under the MIT license.
