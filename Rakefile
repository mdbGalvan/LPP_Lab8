# File: Rakefile

$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc " Run all spec with --format documentation --color"
task :spec2 do
  sh "rspec -Ilib -Ispec spec/fraccion_spec.rb spec/matriz_spec.rb --format documentation --color"
end

desc " Run matriz spec with --format documentation"
task :matriz do
  sh "rspec -Ilib -Ispec spec/matriz_spec.rb --format documentation --color"
end
