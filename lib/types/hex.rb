module ASMOperations
  class Hex < Binary

    attr_accessor :hex

    def initialize(hex)
      @hex = hex
      super(self.to_binary)
    end

    def to_binary
      binary = []
      hex.split('').map do |element|
        hexed_element = HEX_TABLE.keys.detect { |k| k.match(Regexp.new(element, Regexp::IGNORECASE)) }
        binary << ASMOperations::Decimal.new(HEX_TABLE[hexed_element]).to_binary
      end
      binary.join('')
    end
  end
end