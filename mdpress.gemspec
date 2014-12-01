Gem::Specification.new do |s|
    s.name        = "mdpress"
    s.version     = "0.0.18"
    s.date        = "2014-01-21"
    s.summary     = "Build impress.js presentations from markdown files."
    s.description = "Simple gem to build impress.js presentations from markdown files."
    s.author      = "Aditya Bhargava"
    s.email       = "bluemangroupie@gmail.com"
    s.files       = ["README.md", "LICENSE"] + Dir["lib/**/*"] + Dir["bin/**/*"] + Dir["examples/**/*"]
    s.homepage    = "https://github.com/egonSchiele/mdpress"
    s.executables = ["mdpress"]
	# TODO add any dependencies
	s.add_dependency("redcarpet", "~> 3.1")
	s.add_dependency("trollop", "~> 2.0")
	s.add_dependency("launchy", "~> 2.2")
	s.add_dependency("httparty", "~> 0.13")
end
