module HL7
  class FieldDefinition
    attr_reader :name, :type, :position

    def initialize(name, type, position)
      @name = name
      @type = type
      @position = position
    end
  end
end
