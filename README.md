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

### Why would I wanna use Sqwish for Rails?

If you use Sass (or a similar preprocessor), you probably separate your CSS
definitions into multiple files. In Sass, there are two ways to do this:

``` scss
/* Method 1: @import */
@import 'common';
@import 'layout';
@import 'chrome';
@import 'pages';
```

This is very convenient, and efficient in space, but slow. If you change one
Sass file, the rest will have to be recompiled. In big projects, you can be
waiting up to 10 seconds after updating a simple style.

Which leads us to method 2:

```
/* Method 2: Sprockets require */
//= require common
//= require layout
//= require chrome
//= require pages
```

This is faster! Updating one will no longer re-compile the others! The only
problem here is that styles may be duplicated in each file, say, if each
file depends on a web-font. You can end up with:

``` css
/* Method 1's crappy output with YUI :( */
@font-face{font-family:'Montserrat';...}
body{font-family:Montserrat}
@font-face{font-family:'Montserrat';...}
.page h1{font-family:Montserrat}
```

...which YUI (Rails/Sprocket's default compressor) will not optimize for you.

Use Sqwish! It will remove those duplicate @font-faces for you and combine
anything else that can be combined.

``` css
/* Method 2's nice output with Sqwish :D */
@font-face{font-family:'Montserrat';...}
body,.page h1{font-family:Montserrat}
```

## Authors

 * **Sqwish** is by Dustin Diaz @ [github.com/ded/sqwish](https://github.com/ded/sqwish).
 * This Ruby gem is by Rico Sta. Cruz @ [github.com/rstacruz/sqwish.rb](http://github.com/rstacruz/sqwish.rb).

Released under the MIT license.
