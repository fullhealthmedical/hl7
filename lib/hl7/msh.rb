module HL7
  class MSH < Segment
    def initialize(content)
      @configuration = Configuration.from_msh(content)
      @fields = [
        Field.new(configuration.field_separator),
        Field.new(configuration.encoding_characters),
      ] + content.to_s.split(configuration.field_separator)[2..].map { |f| Field.new(f) }
    end

    field :field_separator
    field :encoding_characters
    # field :sending_application
    # field :sending_facility
    # field :receiving_application
    # field :receiving_facility
    # field :date_time_of_message
    # field :security
    # field :message_type
    # field :message_control_id
    # field :processing_id
    # field :version_id
    # field :sequence_number
    # field :continuation_pointer
    # field :accept_acknowledgment_type
    # field :application_acknowledgment_type
    # field :country_code
    # field :character_set
    # field :principal_language_of_message
    # field :alternate_character_set_handling_scheme
    # field :message_profile_identifier
    # field :sending_responsible_organization
    # field :receiving_responsible_organization
    # field :sending_network_address
    # field :receiving_network_address
  end
end
