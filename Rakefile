require 'rake/testtask'

task :default => :test
Rake::TestTask.new :test do |t|
  t.pattern = 'spec/**/*.spec.rb'
end

desc 'Start the web server'
task :server do
  sh 'rackup'
end
