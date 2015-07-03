Gem::Specification.new do |s|
  s.name        = 'opsgenie'
  s.version     = '0.0.2'
  s.date        = '2015-05-12'
  s.add_runtime_dependency "json", ["~> 1.8.2"]
  s.add_development_dependency "byebug", ["~> 4.0.5"]
  s.summary     = "Opsgenie API integration!"
  s.description = "A gem to use opsgenie APIs with ruby"
  s.authors     = ["Shivam Bajpai"]
  s.email       = 'email4shivam@gmail.com'
  s.files       = ["lib/opsgenie.rb"]
  s.homepage    =
    'http://rubygems.org/gems/opsgenie'
  s.license       = 'MIT'
end