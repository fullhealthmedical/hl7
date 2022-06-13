module HL7
  module Fields
    extend ActiveSupport::Concern

    included do
      class_attribute :attributes, default: []
    end

    def self.field(attribute_name, attribute_type = String)
      define_method(attribute_name) do
        attributes[attribute_name]
      end

      define_method("#{attribute_name}=") do |value|
        attributes[attribute_name] = value
      end
    end
  end
end
