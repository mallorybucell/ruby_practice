require 'pry'

class Node
  attr_accessor :value, :lower_node

  def initialize(value, below=nil)
    @value = value
    @lower_node = below
  end

  def to_str
    self.value.to_s
  end

## Really want LinkedList to be its own class. Refactor later.
  #Given a node, print the linked list that begins with that node
  def printable_list
    current_node = self
    list = "["
    until current_node.lower_node.nil?
      list += (current_node.to_str + ", ")
      current_node = current_node.lower_node
    end
    list += (current_node.to_str + "]")
  end



  #Reverse a linked list given its head
  ##  Assumption: Head here means 'first' or 'top' node of singly linked list
  ## fix printing so "top" is at end of string per convention?
  def reverse_list
    current_node = self
    new_lower = nil
    until current_node.nil?
      old_lower = self.lower_node
      current_node.lower_node = new_lower
      new_lower = current_node
      current_node = old_lower
    end
  end
end

#Implement a stack using a linked list

class Stack
  attr_reader :top

  def initialize
    @top = nil
  end

  def push(value)
    lower = @top
    new_node = Node.new(value, lower)
    @top = new_node
    # return revised stack or pushed value?
  end

  def pop
    @top = @top.lower_node
    # return popped value?
  end

end

#test code

node1 = Node.new(1)
node2 = Node.new(2, node1)

puts node1.printable_list
puts node2.printable_list

node2.reverse_list
puts node1.printable_list
puts node2.printable_list