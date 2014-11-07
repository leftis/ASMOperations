module ASMOperations
  class Hex < Binary
    attr_accessor :hex

    def initialize(hex)
      @hex = hex
      super(to_binary)
    end

    def fix_byte(byte)
      return byte if byte.length == 4 || byte.empty?
      remaining_bits = 4 - byte.length
      Array.new(remaining_bits) { '0' }.join('') + byte
    end

    def to_binary
      binary = []
      hex.split('').map do |element|
        hexed_element = HEX_TABLE.keys.detect { |k| k.match(Regexp.new(element, Regexp::IGNORECASE)) }
        binary << fix_byte(ASMOperations::Decimal.new(HEX_TABLE[hexed_element.to_s]).binary)
      end
      binary.join('')
    end
  end
end
