require 'spec_helper'

describe ASMOperations::Hex do
  describe "#new" do
    it "accepts a 16bit hex number as argument" do
      obj = ASMOperations::Hex.new('b90c88')
      expect(obj.binary).to eq('00000000101110010000110010001000')
      expect(obj.bit_count).to eq(32)
    end

    it "accepts a 8bit hex number as argument" do
      obj = ASMOperations::Hex.new('b90c')
      expect(obj.binary).to eq('1011100100001100')
      expect(obj.bit_count).to eq(16)
    end
  end
end