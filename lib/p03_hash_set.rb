require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    @store[key.hash % num_buckets] << key
    @count += 1
    resize! if @count == num_buckets
  end

  def remove(key)
    return false unless include?(key)
    @store[key.hash % num_buckets].delete(key)
    @count -= 1
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_elements = @store.flatten

    @store = Array.new(num_buckets*2) { Array.new }
    @count = 0

    old_elements.each do |element|
      insert(element)
    end
  end
end
