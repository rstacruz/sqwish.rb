require 'execjs'

module Sqwish
  class << self
    def minify(src, options={:strict => false})
      is_strict = !! options[:strict]
      sqwish_js.call "sqwish", src, is_strict
    end

    alias compress minify

    def sqwish_js
      @squish_js ||= ExecJS.compile(sqwish_wrapper)
    end

    def sqwish_wrapper
      # Since we're not using node, some things will have to be stubbed.
      %{
        var require = function() { return {}; };
        var module  = { exports: {} };
        #{sqwish_src}
      }
    end

    def sqwish_src
      src = open(sqwish_js_path).read
    end

    def sqwish_js_path
      File.expand_path '../../sqwish/src/index.js', __FILE__
    end

    def version
      "0.1.2"
    end
  end
end
