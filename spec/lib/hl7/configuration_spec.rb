require 'spec_helper'

RSpec.describe HL7::Configuration do
  let(:field_separator) { "|" }
  let(:encoding_characters) { "^~\\&" }

  it "has a default values" do
    configuration = HL7::Configuration.new
    expect(configuration.field_separator).to eq("|")
    expect(configuration.component_separator).to eq("^")
    expect(configuration.subcomponent_separator).to eq("&")
    expect(configuration.repetition_separator).to eq("~")
    expect(configuration.escape_char).to eq("\\")
    expect(configuration.truncation_char).to be_nil
  end

  it "initializes from paramenters" do
    configuration = HL7::Configuration.new(field_separator, encoding_characters)
    expect(configuration.field_separator).to eq("|")
    expect(configuration.component_separator).to eq("^")
    expect(configuration.subcomponent_separator).to eq("&")
    expect(configuration.repetition_separator).to eq("~")
    expect(configuration.escape_char).to eq("\\")
    expect(configuration.truncation_char).to be_nil
  end

  context 'with custom config' do
    it "initializes correctly" do
      configuration = HL7::Configuration.new("+", "$%*!")
      expect(configuration.field_separator).to eq("+")
      expect(configuration.component_separator).to eq("$")
      expect(configuration.subcomponent_separator).to eq("!")
      expect(configuration.repetition_separator).to eq("%")
      expect(configuration.escape_char).to eq("*")
      expect(configuration.truncation_char).to be_nil
    end

    it "accepts truncation char" do
      configuration = HL7::Configuration.new("|", "^~\\&#")

      expect(configuration.truncation_char).to eq("#")
    end
  end
end
