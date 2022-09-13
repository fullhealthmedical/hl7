module HL7
  class Segment
    include Segments::Fields

    attr_reader :values

    def initialize(content)
      @values = content.to_s.split(configuration.field_separator).map { |f| Field.new(f) }
    end

    def to_hl7
      values.map(&:to_hl7).join(configuration.field_separator)
    end

    def name
      self.class.name.demodulize
    end

    def configuration
      @configuration || HL7.default_configuration
    end

    # def assign_by_position(position, value)
    # end
  end
end
