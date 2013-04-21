# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "beefcake_go_rpcgen"
  gem.homepage = "http://github.com/bradhe/beefcake_go_rpcgen"
  gem.license = "MIT"
  gem.summary = %Q{Go RPCGen backend for Beefcake}
  gem.description = %Q{An implementation of the Go RPCGen protocol}
  gem.email = "brad@cloudability.com"
  gem.authors = ["Brad Heller"]
  gem.files = `git ls-files .`.split("\n").reject! do |file|
    file.start_with?('spec')
    file.start_with?('lib/tasks')
  end
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

Dir[File.expand_path('../lib/tasks/*.rake', __FILE__)].each do |rake_file|
  load rake_file
end

task :environment do
  # TODO: Anything...
end
