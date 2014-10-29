require 'spec_helper'
require 'pry'

describe ASMOperations::Hex do
  describe "#new" do
    # it "accepts a 32bit hex number as argument" do
    #   obj = ASMOperations::Hex.new('b90c88e6')
    #   expect(obj.binary).to eq('10111001000011001000100011100110')
    #   expect(obj.bit_count).to eq(32)
    # end

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

  # describe "#to_integer" do
  #   let(:unsigned_eight_bit) { ASMOperations::UnsignedBinaryToInteger.new('00010110') }
  #   let(:unsigned_sixteen_bit) { ASMOperations::UnsignedBinaryToInteger.new('0011101011010110') }

  #   it "should return integer value for the unsigned binary of 8bit" do
  #     expect(unsigned_eight_bit.to_decimal).to eq(22)
  #   end

  #   it "should return integer value for the unsigned binary of 16bit" do
  #     expect(unsigned_sixteen_bit.to_decimal).to eq(15062)
  #   end
  # end
end