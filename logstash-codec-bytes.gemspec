Gem::Specification.new do |s|
  s.name          = "logstash-codec-bytes"
  s.version       = "0.1.0"
  s.authors       = ["Lob"]
  s.description   = "Logstash codec plugin to chunk an input into parts of a specified number of bytes"
  s.summary       = "Logstash codec plugin to chunk an input into parts of a specified number of bytes"
  s.homepage      = "https://github.com/lob/logstash-codec-bytes"
  s.require_paths = ["lib"]

  s.files = Dir["lib/**/*","spec/**/*","vendor/**/*","*.gemspec","*.md","Gemfile"]

  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "codec" }

  s.add_runtime_dependency "logstash-core", ">= 2.0.0", "< 3.0.0"

  s.add_development_dependency "logstash-devutils"
  s.add_development_dependency "simplecov"
end
