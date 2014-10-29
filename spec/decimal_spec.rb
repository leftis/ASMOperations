require 'spec_helper'

describe ASMOperations::Decimal do
  describe "#new" do
    it "accepts a decimal and stores its binary upon initialization" do
      obj = ASMOperations::Decimal.new(22)
      expect(obj.bit_count).to eq(8)
      expect(obj.binary).to eq('00010110')
    end
  end
end