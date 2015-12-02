# coding: utf-8
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber'
require 'cucumber/rake/task'

# §todo: see task offered : -T flag
# see -> http://pablocantero.com/blog/2011/01/02/new-gem-with-bundler-sample-rakefile/

RSpec::Core::RakeTask.new(:spec)
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task test: [:spec, :features]
task default: :test



