module HL7
  class MSH < Segment
    def initialize(content)
      super
      @configuration = Configuration.new(content[3], content[4, 7])
    end
  end
end
