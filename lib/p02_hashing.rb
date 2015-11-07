class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0

    each_with_index do |element, index|
      hash = hash ^ (element.hash * index.hash)
    end

    hash
  end
end

class String
  def hash
    split("").map { |letter| letter.ord }.hash
  end
end

class Hash
  def hash
    to_a.sort.hash
  end
end

class Symbol


end
