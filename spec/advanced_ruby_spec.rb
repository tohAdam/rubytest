require 'spec_helper'
require_relative '../advanced_ruby'

RSpec.describe AdvancedRuby do
  describe '.apply_block' do
    it 'applies the given block to each element of the array' do
      result = AdvancedRuby.apply_block([1, 2, 3]) { |n| n * 2 }
      expect(result).to eq([2, 4, 6])
    end

    it 'returns the original array if no block is given' do
      result = AdvancedRuby.apply_block([1, 2, 3])
      expect(result).to eq([1, 2, 3])
    end
  end

  describe '.process_data' do
    it 'matches a user hash using pattern matching' do
      result = AdvancedRuby.process_data({ type: "user", name: "Alice", age: 30 })
      expect(result).to eq("User Alice is 30 years old")
    end

    it 'matches an array and extracts first and last elements using pattern matching' do
      result = AdvancedRuby.process_data([10, 20, 30, 40])
      expect(result).to eq("Array from 10 to 40")
    end

    it 'matches a string composed only of digits using pattern matching with guards' do
      result = AdvancedRuby.process_data("12345")
      expect(result).to eq("String of numbers: 12345")
    end

    it 'returns unknown for unmatched data' do
      result = AdvancedRuby.process_data({ type: "unknown" })
      expect(result).to eq("Unknown data format")
    end
  end

  describe '.factorial' do
    it 'returns 1 for 0' do
      expect(AdvancedRuby.factorial(0)).to eq(1)
    end

    it 'returns the correct factorial for positive integers using recursion' do
      expect(AdvancedRuby.factorial(5)).to eq(120)
    end

    it 'raises an error for negative numbers' do
      expect { AdvancedRuby.factorial(-1) }.to raise_error(ArgumentError, /Cannot calculate factorial of negative number/)
    end
  end
end
