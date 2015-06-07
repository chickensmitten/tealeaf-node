require 'pry'

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end

  def tail?
    @next.nil?
  end
end

class SinglyList
  def add(item)
    new_node = Node.new(item)
    new_node.next = @head
    @head, @current, @previous = new_node, new_node, nil
  end

  def find(item)
    @current, @previous = @head, nil
    begin
      if @current.data == item
        return @current.data
      else
        @previous, @current = @current, @current.next
      end
    end until @current.tail?
    @current = nil
  end

  def insert_after_current(item)
    raise "Please find an item first to set as current before insert" unless @current
    new_node = Node.new(item)
    new_node.next = @current.next
    @current.next = new_node
    @current, @previous = new_node, @current
  end

  def remove_current
    raise "Please find an item first to set as current before remove" unless @current
    @previous.next = @current.next

  end

  def size
    node = @head
    counter = 1
    while !node.tail?
      node = node.next
      counter += 1
    end
    counter
  end

  def to_s
    node = @head
    list_string = node.data.to_s
    while !node.tail?
      node = node.next
      list_string += " -> #{node.data}"
    end
    list_string
  end
end

list = SinglyList.new
list.add(123)
list.add('abc')
list.add('xyz')
list.add(890)
p list
p list.size
list.find('xyz')
list.insert_after_current("located_after_xyz")
list.find('abc')
list.insert_after_current('located_after_abc')
p list
p list.size
list.remove_current
p list
p list.size







