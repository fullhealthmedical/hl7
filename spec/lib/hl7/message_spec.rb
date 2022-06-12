require 'spec_helper'

RSpec.describe HL7::Message do
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
end
