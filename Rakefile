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
  gem.name = "capistrano-noty-core"
  gem.homepage = "http://github.com/TMXCredit/capistrano-noty-core"
  gem.license = "MIT"
  gem.summary = %Q{Core of capistrano-noty - Capistrano notification framework.}
  gem.description = <<-EODESC
    Core of capistrano-noty.
    It connect all part of capistrano notification system such ass notification
    channels, data sources and templates together.
    To get to work capistrano notifications use one of channel's gem, 
    for example, such as 'capistrano-noty-email'.
  EODESC
  gem.email = "zekefast@gmail.com"
  gem.authors = ["Zeke Fast"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new


require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end


require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = true
  t.verbose = false
  t.source_files = 'lib/**/*.rb'
end


require 'roodi'
require 'roodi_task'
RoodiTask.new do |t|
  t.verbose = false
end

task :default => :spec


require 'yard'
YARD::Rake::YardocTask.new
