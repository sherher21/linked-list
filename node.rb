class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def to_s
    @value
  end
end
