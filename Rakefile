require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "radiant-radiant_validators-extension"
    gem.summary = %Q{Radiant Validators Extension for Radiant CMS}
    gem.description = %Q{Describe your extension here}
    gem.email = "your email"
    gem.homepage = "http://github.com/JediFreeman/Radiant-Validators-Extension"
    gem.authors = ["Ben Evans"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. This is only required if you plan to package radiant_validators as a gem."
end

desc 'Generate documentation for the radiant_validators extension.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RadiantValidatorsExtension'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Load any custom rakefiles for extension
Dir[File.dirname(__FILE__) + '/tasks/*.rake'].sort.each { |f| require f }
