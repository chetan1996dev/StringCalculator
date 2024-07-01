class StringCalculator

  def add(input)
    return 0 if input.empty?

    delimiter = if input.start_with?("//")
      input.match(%r{//(.+)\n})[1].strip # Extract custom delimiter specified after '//'
    else
      ",|\n" # Default delimiters like comma or newline
    end

    result = input.gsub(%r{//(.+)\n}, "").split(/[#{delimiter}]/).map(&:to_i) # Remove delimiter and split string into numbers
    result.sum
  end
end
