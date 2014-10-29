module ASMOperations
  class Binary

    attr_accessor :bit_count, :binary, :errors, :warnings

    def initialize(unsigned_binary)
      @errors, @warnings = [], []
      @binary = unsigned_binary
      @bit_count = count_bits and unsigned?
      fix_bytes
    end

    def to_decimal
      bits_powers.reduce(0) do |acc, pow|
        acc += 2**pow
      end
    end

    private

    def fix_bytes
      if @binary.length < bit_count
        remaining_bits = bit_count - @binary.length
        @binary = Array.new(remaining_bits) { '0' }.join('') + @binary
      end
    end

    def bits_powers
      @binary.split('').reverse.map.with_index(0).to_a.map do |object|
        next if object.first == '0'
        object.last
      end.compact!
    end

    def unsigned?
      if @binary.split('').first != '0'
        @warnings << 'Number is a signed one'
      end
    end

    def count_bits
      case @binary.split('').length
      when 1..4
        4
      when 5..8
        8
      when 9..16
        16
      when 17..32
        32
      else
        @errors << 'Not an 8 || 16 || 32 bit'
      end
    end
  end
end