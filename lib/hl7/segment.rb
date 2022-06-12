module HL7
  class Segment
    attr_reader :content, :configuration

    def initialize(content)
      @content = content
    end

    def to_hl7
      content
    end

    def to_s
      content
    end
  end
end
