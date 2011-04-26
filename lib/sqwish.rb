require 'execjs'

module Sqwish
  class << self
    def minify(src, options={:strict => true})
      sqwish_js.call "sqwish", src, !! options[:strict]
    end

    def sqwish_js
      @squish_js ||= ExecJS.compile(sqwish_src)
    end

    def sqwish_src
      open(sqwish_js_path).read
    end

    def sqwish_js_path
      File.expand_path '../../sqwish/src/index.js', __FILE__
    end

    def version
      "0.0.2"
    end
  end
end
