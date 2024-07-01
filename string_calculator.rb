class StringCalculator

  def add(input)
    return 0 if input.empty?

    delimiter = if input.start_with?("//")
      input.match(%r{//(.+)\n})[1].strip # Extract custom delimiter specified after '//'
    else
      ",|\n" # Default delimiters like comma or newline
    end

    result = input.gsub(%r{//(.+)\n}, "").split(/[#{delimiter}]/).map(&:to_i) # Remove delimiter and split string into numbers
    validate_numbers(result)
    result.sum
  end

  private

   # Method to validate numbers for negative values
  def validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed: #{ negatives.join(', ') }" if negatives.any?
  end
end
