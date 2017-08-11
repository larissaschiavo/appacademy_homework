class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)

    prc ||= Proc.new{|x, y| x <=> y}

    return self if count < 2

    middle_point = count / 2

    left_side = self[0...middle_point].merge_sort(&prc)
    right_side = self[middle_point..-1].merge_sort(&prc)

    Array.merge(left_side, right_side, &prc)
  end

  private
  def self.merge(left, right, &prc)

    prc ||= Proc.new{|x, y| x <=> y}

    merged = []
    until left.empty? || right.empty?
    case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged

  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  # def pair_sum(target)
  #   ans = []
  #   self.each_with_index do |el, idx|
  #     self.each_index do |j_idx|
  #       while idx <= self.length - 1 && j_idx <= self.length - 1
  #       j_idx = idx + 1
  #       ans << [idx, j_idx] if self[idx] + self[j_idx] == target
  #       j_idx += 1
  #     end
  #   end
  #   ans
  # end
  def pair_sum(target)
    ans = []

    self.each_with_index do |el, idx|
      break if idx >= self.length - 1
      j_idx = idx + 1
      until j_idx == self.length
        ans << [idx, j_idx] if self[idx] + self[j_idx] == target
        j_idx += 1
      end
    end
    ans
  end






end

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  if num == 1
    return [1]
  else

  facs = []

  result = factorials_rec(num - 1)

  facs += result
  facs << (num - 1) * facs.last
  end
  facs
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    strspl = self.split(" ")
    otherspl = other.split(" ")
    otherspl.each do |x|
      if strspl.include?(x) == false
        return false
      end
    end
    if strspl.length == otherspl.length
      return true
    else
      return false
    end
  end
end



# Write a method that returns the nth prime number
def nth_prime(n)
  ans = []
  until ans.length == n
    x = 1
    if x.is_prime?
      ans << x
    end
  x += 1
  end
end

def is_prime?(num)
  (1...num).each do |x|
    if num % x == 0
      return false
    end
  end
  true
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    self.each_index {|idx| prc.call(self[idx])}
  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    prc ||= proc.new {|x, y| x + y}

    if accumulator == nil
      accumulator = self[0]
      self.unshift
    end
    self.each_index {|idx| proc.call(accumulator, self[idx])}
  end
end
