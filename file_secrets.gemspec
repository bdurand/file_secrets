Gem::Specification.new do |s|
  s.name = 'file_secrets'
  s.version = File.read(File.expand_path("../VERSION", __FILE__)).strip
  s.summary = "A simple wrapper for reading sensitive information stored in files."
  s.description = "A simple wrapper for reading sensitive information stored in files to support the pattern of storing secrets in external files outside of a project's code."
  s.license = 'MIT'

  s.authors = ['Brian Durand']
  s.email = ['bbdurand@gmail.com']
  s.homepage = "http://github.com/bdurand/file_secrets"

  s.files = ['README.md', 'VERSION', 'Rakefile', 'MIT_LICENSE'].concat(Dir.glob('lib/**/*')).concat(Dir.glob('spec/**/*'))
  s.require_path = 'lib'
  
  s.add_development_dependency("rspec", ["~> 3.0"])
end
