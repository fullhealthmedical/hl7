require 'spec_helper'

RSpec.describe HL7::Message do
  let(:empty_message) { described_class.new }

  it "has default configuration" do
    expect(empty_message.configuration).not_to be nil

    expect(empty_message.configuration.field_separator).to eq("|")
    expect(empty_message.configuration.component_separator).to eq("^")
    expect(empty_message.configuration.subcomponent_separator).to eq("&")
    expect(empty_message.configuration.repetition_separator).to eq("~")
    expect(empty_message.configuration.escape_char).to eq("\\")
    expect(empty_message.configuration.truncation_char).to be_nil
  end

  context 'initializing from content' do
    let(:content) do
      "MSH|^~\\&|SENDING|SENDING|SENDING|20100401|0900||ADT^A04|123456789|P|2.3\r" \
      "PID|1||PATIENT^PATIENT^P^^^^L|PATIENT|M|||"
    end

    it "builds a message with segments" do
      message = HL7::Message.new(content)
      expect(message.segments.size).to eq(2)
    end

    it "builds a MSH segment" do
      message = HL7::Message.new(content)
      expect(message.msh).not_to be nil
      expect(message.msh).to be_a(HL7::MSH)
    end

    context "using custom configuration from MSH segment" do
      it "overrides default configuration" do
        msg_content = "MSH/%*\\£/SENDING/SENDING/SENDING/20100401/0900//ADT^A04/123456789/P/2.3\r"
        message = HL7::Message.new(msg_content)

        expect(message.configuration.field_separator).to eq("/")
        expect(message.configuration.component_separator).to eq("%")
        expect(message.configuration.subcomponent_separator).to eq("£")
        expect(message.configuration.repetition_separator).to eq("*")
        expect(message.configuration.escape_char).to eq("\\")
        expect(message.configuration.truncation_char).to be_nil
      end

      it "accepts truncation char" do
        msg_content = "MSH/%*\\£#/SENDING/SENDING/SENDING/20100401/0900//ADT^A04/123456789/P/2.3\r"
        message = HL7::Message.new(msg_content)

        expect(message.configuration.truncation_char).to eq("#")
      end
    end
  end
end
