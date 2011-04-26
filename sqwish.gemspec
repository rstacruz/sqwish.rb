Gem::Specification.new do |s|
  s.name = "sqwish"
  s.version = "0.0.2"
  s.summary = "A node-based CSS compressor"
  s.description = "Compresses CSS."
  s.authors = ["Rico Sta. Cruz", "Dustin Diaz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = "http://github.com/rstacruz/sqwish"
  s.files = ["lib/sqwish.rb", "sqwish/src/index.js", "HISTORY.md", "README.md"]

  s.add_dependency "execjs"
end
