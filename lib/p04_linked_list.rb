
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil, prev = nil)
    @key, @val, @next, @prev = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = nil #Link.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def tail
    @tail
  end

  def empty?
    @head == nil
  end

  def get(key)
    this_link = @head
    while this_link
      return this_link.val if this_link.key == key
      this_link = this_link.next
    end
    nil
  end

  def include?(key) #returns the link if the key is found, else false
    this_link = @head
    until this_link.nil?
      return this_link if this_link.key == key
      this_link = this_link.next
    end
    return false
  end

  def insert(key, val)
    if empty?
      @head = Link.new(key, val, nil, nil)
      @tail = @head
    else
      new_link = Link.new(key, val, nil, @tail)
      @tail.next = new_link
      @tail = new_link
    end

  end

  def remove(key)
    if @head.key == key
      @head = @head.next
      @head.prev = nil
      return
    end

    this_link = @head
    previous_link = @head
    until this_link.nil?
      if this_link.key == key
        previous_link.next = this_link.next
        previous_link.next.prev = previous_link
      end
      previous_link = this_link
      this_link = this_link.next
    end
  end


  def each(&block)
    this_link = @head
    until this_link.nil?
      block.call(this_link)
      this_link = this_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

if $PROGRAM_NAME == __FILE__
  list = LinkedList.new
  list.insert(500, 1000)
  list.insert(5, 'kite')
  list.insert(10, 'mf')
  list.each do |item|
    p item
  end
  #p list
  puts "\n"
  list.remove(78)
  list.remove(500)
  p list.include?(5)
  puts "\n"
  p list.include?("jj")
  puts "\n"
  p list
end
