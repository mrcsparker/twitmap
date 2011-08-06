require 'rubygems'
require 'bundler/setup'

require 'twitmap'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
