class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    node = @head
    return node unless node.next
    return node unless node.next while (node = node.next)
  end
  
  def append(value)
    @head ? tail.next = Node.new(value) : @head = Node.new(value)
  end  

  def prepend(value)
    node = Node.new(value)
    if @head
      node.next = @head
      @head = node
    else
      @head = node
    end
  end

  def size
    (node = @head) ? count = 1 : count = 0
    while (node = node.next)
      count += 1
    end
    count
  end

  def at(index)
    node = @head
    i = 0
    while i < index
      node = node.next
      i += 1
    end
    node
  end

  def pop
    nil if size < 1
    node = @head
    node = node.next until node.next == tail
    node.next = nil
    tail = node
  end
  
  def contains?(value)
    node = @head
    contain = false
    until node.nil?
      contain = true if node.value == value
      node = node.next 
    end
    contain
  end

  def find(value)
    node = @head
    index = nil
    i = 0
    until node.nil?
      index = i if node.value == value
      node = node.next
      i += 1
    end
    index
  end

  def to_s
    node = @head
    string = ""
    until node.nil?
      string << "(#{node.value}) -> "
      node = node.next
    end
    string << "nil"
    puts string
  end

  def insert_at(value, index)
    return puts "Error! Index out of bound!" if index > size + 1 || index < 0
    return append(value) if index == size
    return prepend(value) if index == 0
    new_node = Node.new(value)
    prev = at(index - 1)
    new_node.next = prev.next
    prev.next = new_node
  end

  def remove_at(index)
    return puts "Error! Index out of bound!" if index > size + 1 || index < 0
    return pop if index == size - 1
    @head = @head.next if index == 0
    i = 0
    node = @head
    while i < index
      node = node.next
      i += 1
    end
    prev = at(index - 1)
    prev.next = node.next
  end
end
