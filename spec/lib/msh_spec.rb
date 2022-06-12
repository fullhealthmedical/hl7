require 'spec_helper'

RSpec.describe HL7::MSH do
  let(:content) do
    "MSH|^~\\&|SENDING|SENDING|SENDING|20100401|0900||ADT^A04|123456789|P|2.3"
  end

  xit "builds a message with fields" do
    message = HL7::MSH.new(content)
    expect(message.fields.size).to eq(2)
  end

  context 'reading configuration' do
    it "reads configuration from segment" do
      msh = HL7::MSH.new(content)
      expect(msh.configuration.field_separator).to eq("|")
      expect(msh.configuration.component_separator).to eq("^")
      expect(msh.configuration.repetition_separator).to eq("~")
      expect(msh.configuration.escape_char).to eq("\\")
      expect(msh.configuration.subcomponent_separator).to eq("&")
      expect(msh.configuration.truncation_char).to be_nil
    end

    context 'when enconding characters contain Truncation character' do
      let(:content) do
        "MSH|^~\\&#|SENDING|SENDING|SENDING|20100401|0900||ADT^A04|123456789|P|2.3"
      end

      it "reads configuration with truncation char" do
        msh = HL7::MSH.new(content)
        expect(msh.configuration.field_separator).to eq("|")
        expect(msh.configuration.component_separator).to eq("^")
        expect(msh.configuration.repetition_separator).to eq("~")
        expect(msh.configuration.escape_char).to eq("\\")
        expect(msh.configuration.subcomponent_separator).to eq("&")
        expect(msh.configuration.truncation_char).to eq("#")
      end
    end
  end
end
