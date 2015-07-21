class Node
  attr_accessor :parent, :value, :left, :right

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
  end

  def info
    "[Node info] Value: #{@value} Parent: #{@parent} Left Child: #{@left} Right Child: #{@right}"
  end

end

class Tree
  attr_accessor :root

  def build_tree(values)
    @root = Node.new(values[0])
    current_node = @root
    values[1..-1].each do |value|
      loop do
        if value < current_node.value
          if current_node.left == nil
            current_node.left = Node.new(value, parent = current_node)
            break
          else
            current_node = current_node.left
          end
        else
          if current_node.right == nil
            current_node.right = Node.new(value, parent = current_node)
            break
          else
            current_node = current_node.right
          end
        end
      end
    end
  end

  def easy_search(value)
    current_node = @root
    loop do
      if current_node.value = value
        puts "Found value!"
        puts current_node.info
        break
      elsif value < current_node.value 
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      end
    end
  end

  def breadth_first_search(value)
    queue = [@root]

    until queue.empty? do
      current_node = queue.shift
      return current_node.info if current_node.value == value
      queue << current_node.left if current_node.left 
      queue << current_node.right if current_node.right
    end
    "Value not found."
  end

  def depth_first_search(value)
    stack = [@root]

    until stack.empty? do
      current_node = stack.pop
      return current_node.info if current_node.value == value
      stack << current_node.left if current_node.left
      stack << current_node.right if current_node.right
    end
    "Value not found."
  end

  def dfs_rec(value, current_node=nil)
    current_node = @root unless current_node
    if current_node.value == value
      return current_node.info
    else
      left_search = dfs_rec(value, current_node.left) if current_node.left
      return left_search if left_search
      right_search = dfs_rec(value, current_node.right) if current_node.right
      return right_search if right_search   
    end
  end

end

sorted = [1, 3, 5, 7, 2, 4, 6, 8]
unsorted = [11, 7, 4, 231, 8, 9, 3, 5, 67, 6345, 324]

t = Tree.new
t.build_tree(sorted)
p t
puts t.breadth_first_search(5)
puts t.depth_first_search(5)
puts t.dfs_rec(5)