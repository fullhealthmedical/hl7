require 'spec_helper'

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
      expect(configuration.truncation_char).to be_nil
    end
  end

  context 'parse' do
    let(:content) { "MSH|^~\&|SENDING|SENDING|SENDING|20100401|0900||ADT^A04|123456789|P|2.3\r" }

    it "builds a message" do
      message = HL7.parse(content)
      expect(message).not_to be nil
      expect(message.segments.size).to eq(1)
    end
  end
end
