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

end

  #Reverse a linked list given its head
  ##  Assumption: Head here means 'first' or 'top' node of singly linked list
  def reverse_list
    current_node = self
    new_lower = nil
    until current_node.value.nil?
      old_lower = self.lower_node
      current_node.lower_node = new_lower
      new_lower = current_node
      current_node = old_lower
    end
  end

#Implement a stack using a linked list

class Stack
  attr_reader 

  def initialize

  end

  def push(value)

   
  end

  def pop

  end

end

#test code

node1 = Node.new(1)
node2 = Node.new(2, node1)

puts node2.printable_list