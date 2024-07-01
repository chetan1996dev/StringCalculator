class StringCalculator

  def add(input)
    return 0 if input.empty?

    delimiter = extract_delimiter(input)
    numbers = extract_numbers(input, delimiter)
    validate_numbers(numbers)

    numbers.sum
  end

  private

  # Method to extract delimiter from input string
  def extract_delimiter(input)
    if input.start_with?("//")
      input.match(%r{//(.+)\n})[1].strip # Extract custom delimiter specified after '//'
    else
      ",|\n" # Default delimiters like comma or newline
    end
  end

  # Method to extract numbers from string
  def extract_numbers(input, delimiter)
    input.gsub(%r{//(.+)\n}, "").split(/[#{delimiter}]/).map(&:to_i) # Remove delimiter and split string into numbers
  end

  # Method to validate numbers for negative values
  def validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
