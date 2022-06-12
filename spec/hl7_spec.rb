# frozen_string_literal: true

RSpec.describe HL7 do
  it "has a version number" do
    expect(HL7::VERSION).not_to be nil
  end

  context 'configuration' do
    subject(:configuration) { HL7.default_configuration }

    it "has a default configuration" do
      expect(configuration).not_to be nil
    end

    it "uses default HL7 spec as default" do
      expect(configuration.field_separator).to eq("|")
      expect(configuration.component_separator).to eq("^")
      expect(configuration.subcomponent_separator).to eq("&")
      expect(configuration.repetition_separator).to eq("~")
      expect(configuration.escape_char).to eq("\\")
    end
  end
end
