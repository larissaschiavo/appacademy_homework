#Exercise 1 - Stack
#LIFO
class Stack
  def initialize
    @stack = Array.new
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

x = Stack.new
x.add(5)
x.add(6)
x.add(7)
x.remove
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and show.
# Test your code to ensure it follows the principle of FIFO.
#FIFO
class Queue
  def initialize
    @queue = Array.new
  end

  def self.enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def self.show
    @queue.dup
  end
end


#create a Map class using only arrays - arrays in arrays of k,v pairs

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
      if @map.lookup(key)
        @map.remove(key)
      end
    @map << [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      return true if pair[0] == key
    end
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if pair[0] == key
    end
  end

  def show
    @map.dup
  end

end
