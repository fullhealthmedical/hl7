module HL7
  ##
  #
  class Configuration
    attr_accessor :field_separator, :component_separator, :repetition_separator, :escape_char,
                  :subcomponent_separator

    def initialize(field_separator = "|", encoding_characters = "^~\\&")
      @field_separator = field_separator
      @component_separator = encoding_characters[0]
      @repetition_separator = encoding_characters[1]
      @escape_char = encoding_characters[2]
      @subcomponent_separator = encoding_characters[3]
    end
  end
end
