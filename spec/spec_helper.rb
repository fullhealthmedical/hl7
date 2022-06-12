require "pry-byebug"
require "hl7"


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

RSpec::Matchers.define :be_named_as do |expected_name|
  match do |segment_instance|
    segment_instance.name == expected_name
  end
  failure_message do |segment_instance|
    "expected that #{segment_instance.class}#name to be #{expected_name}. Actual name is #{segment_instance.name}"
  end
end
