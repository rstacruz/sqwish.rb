require './lib/sqwish'

Gem::Specification.new do |s|
  s.name = "sqwish"
  s.version = Sqwish.version
  s.summary = "A node-based CSS compressor"
  s.description = "Compresses CSS."
  s.authors = ["Rico Sta. Cruz", "Dustin Diaz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = "http://github.com/rstacruz/sqwish.rb"
  s.files = Dir["lib/**/*", "sqwish/src/*", "*.md", "Rakefile"].reject { |f| File.directory?(f) }

  s.add_dependency "execjs"
end
