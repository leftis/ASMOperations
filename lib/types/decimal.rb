module ASMOperations
  class Decimal < Binary

    attr_accessor :decimal

    def initialize(decimal)
      @decimal = decimal
      super(self.to_binary)
    end

    def to_binary
      remaining, bit = decimal.to_i, 0
      bits = []

      bits = [0, 0, 0, 0] if remaining == 0

      while remaining > 0 do
        bits.push(remaining % 2)
        remaining /= 2
      end

      bits.reverse!
      bits.map!(&:to_s).join('')
    end
  end
end