module HL7
  ##
  #
  class Configuration
    attr_accessor :field_separator, :component_separator, :repetition_separator, :escape_char,
                  :subcomponent_separator, :truncation_char, :encoding_characters

    def initialize(field_separator = "|", encoding_characters = "^~\\&")
      @field_separator = field_separator
      @encoding_characters = encoding_characters
      read_encoding_characters(encoding_characters)
    end

    def self.from_msh(msh)
      new(msh[3], msh[4, 7])
    end

    private

    def read_encoding_characters(encoding_characters)
      @component_separator = encoding_characters[0]
      @repetition_separator = encoding_characters[1]
      @escape_char = encoding_characters[2]
      @subcomponent_separator = encoding_characters[3]
      @truncation_char = encoding_characters[4] if encoding_characters[4] != field_separator
    end
  end
end
