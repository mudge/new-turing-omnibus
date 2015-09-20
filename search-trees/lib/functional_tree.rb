class FunctionalTree
  class Nil
    def search(_name)
      nil
    end

    def values
      []
    end

    def depth
      []
    end

    def to_a
      []
    end

    def insert(name)
      FunctionalTree.new(name, self.class.new, self.class.new)
    end
  end

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def to_a
    [self]
  end

  def search(name)
    if value == name
      self
    elsif name < value
      left.search(name)
    elsif name > value
      right.search(name)
    end
  end

  def values
    [value]
  end

  def depth
    values + left.depth + right.depth
  end

  def breadth(result = [], nodes = [self])
    if nodes.empty?
      result
    else
      node, *others = nodes
      breadth(result + node.values, others + node.left.to_a + node.right.to_a)
    end
  end

  def insert(name)
    if name < value
      left.insert(name)
    elsif name > value
      right.insert(name)
    else
      self
    end
  end

  attr_reader :value, :left, :right
end
