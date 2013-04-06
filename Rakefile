require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "pivotxt"
    gem.summary = %Q{Pivotxt lets you easily create stories in Pivotal Tracker from a simple text file.}
    gem.description = %Q{Pivotxt lets you easily create stories in Pivotal Tracker from a simple text file.}
    gem.email = "gabe@avantbard.com"
    gem.homepage = "http://github.com/gabehollombe/pivotxt"
    gem.authors = ["Gabe Hollombe"]
    gem.add_dependency "treetop"
    gem.add_dependency "pivotal-tracker"
    gem.add_development_dependency "jeweler"
    gem.add_development_dependency "rspec", "~> 1.2.9"
    gem.add_development_dependency "fakeweb"
    gem.add_development_dependency "rake"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

task :default => :spec

