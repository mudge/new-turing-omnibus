class ArrayTree
  attr_reader :top
  private :top

  def initialize(items, left, right, top = 1)
    @items = items
    @left = left
    @right = right
    @top = top
  end

  def search(name)
    found = false
    node = top

    until node.nil?
      if items(node) == name
        puts "Yes"
        node = nil
        found = true
      elsif items(node) > name
        node = left(node)
      elsif items(node) < name
        node = right(node)
      end
    end

    puts "No" unless found
  end

  def depth(x = top)
    puts items(x)

    depth(left(x)) if left(x)
    depth(right(x)) if right(x)
  end

  def breadth
    nodes = [top]

    until nodes.empty?
      node = nodes.shift
      puts items(node)

      nodes << left(node) if left(node)
      nodes << right(node) if right(node)
    end
  end

  private

  def items(node)
    @items[node.pred]
  end

  def left(node)
    @left[node.pred]
  end

  def right(node)
    @right[node.pred]
  end
end

