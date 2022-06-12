module HL7
  class Message
    SEGMENT_SEPARATOR = "\r".freeze

    attr_reader :segments

    def initialize(content)
      @segments = content.split(SEGMENT_SEPARATOR).map { |segment| Segment.new(segment) }
    end

    def to_hl7
      segments.map(&:to_hl7).join(SEGMENT_SEPARATOR)
    end

    private

    def configuration
      @configuration = HL7.default_configuration
    end
  end
end
