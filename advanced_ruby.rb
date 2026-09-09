class AdvancedRuby
  # 1. Blocks: A method that takes a block and yields to it
  def self.apply_block(array)
    return array unless block_given?
    
    result = []
    array.each do |element|
      result << yield(element)
    end
    result
  end

  # 2. Pattern Matching: Extracting and matching structured data
  def self.process_data(data)
    case data
    in { type: "user", name: String => name, age: Integer => age }
      "User #{name} is #{age} years old"
    in [first, *, last]
      "Array from #{first} to #{last}"
    in String => s if s.match?(/^\d+$/)
      "String of numbers: #{s}"
    else
      "Unknown data format"
    end
  end

  # 3. Recursion: Calculating factorial
  def self.factorial(n)
    raise ArgumentError, "Cannot calculate factorial of negative number" if n < 0
    return 1 if n == 0 || n == 1
    
    n * factorial(n - 1)
  end
end
