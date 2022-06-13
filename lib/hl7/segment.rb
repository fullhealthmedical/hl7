module HL7
  class Segment
    attr_reader :fields

    class_attribute :fields_definitions, default: []

    def initialize(content)
      @fields = content.to_s.split(configuration.field_separator).map { |f| Field.new(f) }
    end

    def to_hl7
      fields.map(&:to_hl7).join(configuration.field_separator)
    end

    def name
      self.class.name.demodulize
    end

    def configuration
      @configuration || HL7.default_configuration
    end

    # def assign_by_position(position, value)
    # end

    def self.field(attribute_name, attribute_type = String)
      fields_definitions << FieldDefinition.new(attribute_name, attribute_type, fields_definitions.size + 1)

      define_method(attribute_name) do
        field_position = fields_definitions.find { |fd| fd.name == attribute_name }.position - 1

        fields[field_position]
      end

      define_method("#{attribute_name}=") do |value|
        field_position = fields_definitions.find { |fd| fd.name == attribute_name }.position - 1

        fields[field_position] = Field.new(value)
      end
    end

    def self.fields_count
      fields_definitions.size
    end
  end
end
