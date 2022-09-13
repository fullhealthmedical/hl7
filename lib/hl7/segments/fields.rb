module Segments
  module Fields
    extend ActiveSupport::Concern

    included do
      class_attribute :fields_definitions, default: []
    end

    class_methods do
      def field(attribute_name, attribute_type = String)
        fields_definitions << HL7::FieldDefinition.new(attribute_name, attribute_type, fields_definitions.size + 1)

        _define_reader(attribute_name)
        _define_writer(attribute_name)
      end

      def fields_count
        fields_definitions.size
      end

      # :private:

      def _define_reader(attribute_name)
        define_method(attribute_name) do
          field_position = fields_definitions.find { |fd| fd.name == attribute_name }.position - 1

          values[field_position]
        end
      end

      def _define_writer(attribute_name)
        define_method("#{attribute_name}=") do |value|
          field_position = fields_definitions.find { |fd| fd.name == attribute_name }.position - 1

          values[field_position] = Field.new(value)
        end
      end
    end
  end
end
