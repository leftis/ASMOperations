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
        hexed_element = hex_table.keys.detect { |k| k.match(Regexp.new(element, Regexp::IGNORECASE)) }
        binary << ASMOperations::Decimal.new(hex_table[hexed_element]).to_binary
      end
      binary.join('')
    end

    private

    def hex_table
      {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' =>10, 'B' =>11, 'C' =>12, 'D' =>13, 'E' =>14, 'F' => 15
      }
    end
  end
end