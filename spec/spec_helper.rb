require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require "mail"

# not sure how to test a rails engine
require File.expand_path('../../app/models/letter_opener/letter.rb', __FILE__)


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

module Rails
  def self.root
    Pathname.new(__FILE__) + '../..'
  end
end
