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
  attr_accessor :num_buckets, :count
  attr_reader :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    index = num % @store.length
    if !@store[index].include?(num)
        @store[index] << num
        @count += 1
    end
    if count > @store.length 
      resize!
    end
  end

  def remove(num)
    index = num % @store.length
    if @store[index].include?(num)
      @store[index].delete(num)
      @count -= 1
    end

    # bucket_index = num % @store.length
    # if store[bucket_index].include?(num)
    #   store[bucket_index].delete(num)
    #   @count -= 1
    # end
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @num_buckets * 2
    
    stores = self.store
    @num_buckets.times{@store << Array.new}
    stores.flatten.each do |bucket|
      new_ind = bucket % new_size
      @store[new_ind] << bucket
    end
  end

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end
end