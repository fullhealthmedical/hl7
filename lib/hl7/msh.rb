module HL7
  class MSH < Segment
    def initialize(content)
      @configuration = Configuration.new(content[3], content[4, 7])
      super
    end
  end
end
