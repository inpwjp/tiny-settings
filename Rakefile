require "bundler/gem_tasks"

require 'rake/testtask'
require 'active_support'

task :default => :test

desc 'Run test_unit based test'
Rake::TestTask.new do |t|
  # To run test for only one file (or file path pattern)
  #  $ bundle exec rake test TEST=test/test_specified_path.rb
  t.test_files = Dir["test/test_*.rb"]
  t.verbose = true
  t.warning = false
end