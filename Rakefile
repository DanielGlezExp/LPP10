require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Solo las pruebas de dieta"
task :dieta do
  sh "rspec ./spec/huella_ambiental_spec.rb"
end

desc "Solo las pruebas de nodo"
task :nodo do
  sh "rspec ./spec/nodo_spec.rb"
end

desc "Solo las pruebas de Lista"
task :lista do
  sh "rspec ./spec/lista_spec.rb"
end
