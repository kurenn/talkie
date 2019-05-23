require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :dummy do
  require_relative "spec/dummy/application"
  Dummy::Application.load_tasks
end
