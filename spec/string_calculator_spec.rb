require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it 'handles a large number of numbers' do
      expect(calculator.add("1,2,3,4,5,6,7,8,9,10")).to eq(55)
    end

    it 'handles a string with no numbers' do
      expect(calculator.add(",")).to eq(0)
    end

    it 'handles a string with trailing delimiter' do
      expect(calculator.add("1,2,3,")).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles a string with multiple delimiters' do
      expect(calculator.add("1,2\n3")).to eq(6)
    end

    it 'supports different delimiters of any length' do
      expect(calculator.add("//[***]\n1**2***3")).to eq(6)
    end

    it 'supports multiple different delimiters' do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'supports multiple different delimiters with length more than one' do
      expect(calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
    end

    it 'handles multiple delimiters in complex cases' do
      expect(calculator.add("//[*][%][#]\n1*2%3#4")).to eq(10)
    end

    it 'raises an exception for negative numbers' do
      expect { calculator.add("1,-2") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'raises an exception with all negative numbers in the message' do
      expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end
  end
end
