module HL7
  class Message
    SEGMENT_SEPARATOR = "\r".freeze

    attr_reader :segments, :msh

    def initialize(content)
      segments_content = content.split(SEGMENT_SEPARATOR)
      @msh = MSH.new(segments_content.shift)
      @segments = segments_content.map { |segment| Segment.new(segment) }.unshift(@msh)
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
