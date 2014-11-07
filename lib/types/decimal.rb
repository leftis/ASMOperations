module ASMOperations
  class Decimal < Binary
    attr_accessor :decimal

    def initialize(decimal)
      @decimal = decimal
      super(self.to_binary)
    end

    def to_binary
      remaining, _bit = decimal.to_i, 0
      bits = (remaining == 0 ? [0, 0, 0, 0] : [])

      while remaining > 0
        bits.push(remaining % 2)
        remaining /= 2
      end

      bits.reverse!
      bits.map!(&:to_s).join('')
    end
  end
end
