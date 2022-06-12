module HL7
  class Segment
    attr_reader :fields

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
  end
end
