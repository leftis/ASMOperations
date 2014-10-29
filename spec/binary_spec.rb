require 'pry'
require 'spec_helper'

describe ASMOperations::Binary do
  describe "#new" do
    it "does warn on signed binary numbers" do
      obj = ASMOperations::Binary.new('1000000000011111')
      expect(obj.warnings).not_to be_empty
    end

    it "does not accept bit numbers larger than 64 bits" do
      obj = ASMOperations::Binary.new('00000000000111110000000000011111000000000001111100000000000111110')
      expect(obj.errors).not_to be_empty
    end

    it "accepts a 64bit binary number as argument" do
      obj = ASMOperations::Binary.new('0000000000011111000000000001111100000000000111110000000000011111')
      expect(obj.binary).not_to be(nil)
      expect(obj.bit_count).to eq(64)
    end

    it "accepts a 32bit binary number as argument" do
      obj = ASMOperations::Binary.new('00000000000111110000000000011111')
      binding.pry
      expect(obj.binary).not_to be(nil)
      expect(obj.bit_count).to eq(32)
    end

    it "accepts a 16bit binary number as argument" do
      obj = ASMOperations::Binary.new('0000000000011111')
      expect(obj.binary).not_to be(nil)
      expect(obj.bit_count).to eq(16)
    end

    it "accepts a 8bit binary number as argument" do
      obj = ASMOperations::Binary.new('00011111')
      expect(obj.binary).not_to be(nil)
      expect(obj.bit_count).to eq(8)
    end
  end

  describe "#to_integer" do
    let(:unsigned_eight_bit) { ASMOperations::Binary.new('00010110') }
    let(:unsigned_sixteen_bit) { ASMOperations::Binary.new('0011101011010110') }
    let(:unsigned_trirtytwo_bit) { ASMOperations::Binary.new('00000000000111110000000000011111') }

    it "should return integer value for the unsigned binary of 8bit" do
      expect(unsigned_trirtytwo_bit.to_decimal).to eq(2031647)
    end

    it "should return integer value for the unsigned binary of 8bit" do
      expect(unsigned_eight_bit.to_decimal).to eq(22)
    end

    it "should return integer value for the unsigned binary of 16bit" do
      expect(unsigned_sixteen_bit.to_decimal).to eq(15062)
    end
  end
end