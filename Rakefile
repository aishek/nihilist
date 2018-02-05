require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc 'Run tests'
task :default => :test

require 'juwelier'
Juwelier::Tasks.new do |gem|
  gem.name        = 'nihilist'
  gem.homepage    = "https://github.com/aishek/nihilist"
  gem.license     = 'MIT'
  gem.summary     = 'Nihilist simplifies NullObject pattern classes'
  gem.description = 'After include Nihilist module all ?-ends methods will return false, all non-!-ends methods will return nil.'
  gem.email       = 'ab@cifronomika.ru'
  gem.authors     = ['Alexandr Borisov']
  gem.version     = File.read('VERSION').chomp

  if gem.respond_to?(:metadata)
    gem.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
