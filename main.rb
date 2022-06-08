require_relative 'linked-list.rb'
require_relative 'node.rb'

list = LinkedList.new
list.append(5)
list.append(4)
list.prepend(6)
list.prepend(7)

list.remove_at(3)
list.append(1)

list.to_s


