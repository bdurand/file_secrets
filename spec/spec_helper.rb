require File.expand_path("../../lib/file_secrets.rb", __FILE__)

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:expect]
  end
  config.mock_with :rspec do |c|
    c.syntax = [:expect]
  end
end
