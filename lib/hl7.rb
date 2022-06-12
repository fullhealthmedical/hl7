require "active_support/core_ext/module/attribute_accessors"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/class/attribute"

require_relative "hl7/version"
require_relative "hl7/configuration"
require_relative "hl7/field"
require_relative "hl7/message"
require_relative "hl7/segment"
require_relative "hl7/msh"

module HL7
  mattr_accessor :default_configuration
  self.default_configuration = Configuration.new
  def self.config
    yield default_configuration
  end

  def self.parse(content)
    Message.new(content)
  end
end
