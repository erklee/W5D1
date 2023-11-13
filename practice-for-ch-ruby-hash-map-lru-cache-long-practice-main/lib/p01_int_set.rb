class MaxIntSet
  attr_reader :max, :store
  attr_writer :store
  def initialize(max)
    @store = Array.new(max) {false}
    @max = max
    
  end

  
  def insert(num)
    if num < 0 || num > max
      raise "Out of bounds"
    else
      @store[num] = true 
    end
  end

  def remove(num)
    @store.delete_at(num)

  end

  def include?(num) #num is an index
    # insert(num)
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end

class IntSet
  attr_accessor :num_buckets
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if num > 0 || num > num_buckets
      num_buckets == num
    end
    @store[num] = num
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num] == num
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :num_buckets
  attr_reader :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if num > 0 || num > num_buckets
      num_buckets == num
    end
    @count = num
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end