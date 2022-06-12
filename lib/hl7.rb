require 'active_support/core_ext/module/attribute_accessors'

require_relative "hl7/version"
require_relative "hl7/configuration"

module HL7
  mattr_accessor :default_configuration
  self.default_configuration = Configuration.new

  def self.config
    yield default_configuration
  end
end
