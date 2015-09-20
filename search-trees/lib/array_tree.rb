class ArrayTree
  attr_reader :top
  private :top

  def initialize(items, left, right, top = 0)
    @items = items
    @left = left
    @right = right
    @top = top
  end

  def search(name, node = top)
    while node && name != items[node]
      node = if name < items[node]
        left[node]
      else
        right[node]
      end
    end

    node
  end

  def depth(x = top)
    puts items[x]

    depth(left[x]) if left[x]
    depth(right[x]) if right[x]
  end

  def breadth
    nodes = [top]

    until nodes.empty?
      node = nodes.shift
      puts items[node]

      nodes << left[node] if left[node]
      nodes << right[node] if right[node]
    end
  end

  def insert(name)
    node = top
    next_index = items.size

    while node
      node = if items[node] > name
        unless left[node]
          insert_at(name, next_index)

          left[node] = next_index
        end

        left[node]
      elsif items[node] < name
        unless right[node]
          insert_at(name, next_index)

          right[node] = next_index
        end

        right[node]
      end
    end
  end

  attr_reader :items, :left, :right, :top
  private :items, :left, :right, :top

  private

  def insert_at(name, index)
    items[index] = name
    left[index] = nil
    right[index] = nil
  end
end

