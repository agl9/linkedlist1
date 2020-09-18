# frozen_string_literal: true

# class representing the main linked list
class LinkedList
  attr_accessor :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    @size += 1
    newnode = Node.new(value)
    @head.nil? ? @head = newnode : @tail.next_node = newnode
    @tail = newnode
  end

  def prepend(value)
    @size += 1
    newnode = Node.new(value)
    @head.nil? ? @tail = newnode : newnode.next_node = @head
    @head = newnode
  end

  def atindex(val)
    return 'Outside range of Linked List' if val.negative? || val > @size - 1

    node = @head
    val.times { node = node.next_node }
    node
  end

  def pop
    if @size < 2
      @head = nil
      @tail = nil
      deleted = nil
    else
      deleted = @tail
      @tail = self.atindex(@size - 2)
      @tail.next_node = nil
    end
    @size -= 1 unless @size.zero?

    deleted
  end

  def contains?(val)
    node = @head
    @size.times do
      return true if node.data == val

      node = node.next_node
    end
    false
  end

  def find(val)
    node = @head
    index = 0
    @size.times do
      return index if node.data == val

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    output = ''
    node = @head
    @size.times do
      output += "#{node.data} -> "
      node = node.next_node
    end
    output += 'nil'
  end

  def insert_at(val, index)
    return 'Invalid index' if index.zero? || index > @size

    insert = self.atindex(index)
    node = Node.new(val, insert)
    index.zero? ? @head = node : self.atindex(index - 1).next_node = node
    @size += 1
  end

  def remove_at(index)
    return 'Invalid index' if index.negative? || index > @size

    delete = self.atindex(index)
    index.zero? ? @head = delete.next_node : self.atindex(index - 1).next_node = delete.next_node
    @size -= 1
    delete
  end
end

# Class defining individual nodes
class Node
  attr_accessor :data, :next_node
  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end
# Alternate way of defining node:- Node = Struct.new(:data, :next)
