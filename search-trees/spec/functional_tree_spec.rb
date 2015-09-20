require 'functional_tree'

RSpec.describe FunctionalTree do
  describe '#search' do
    it 'returns truthy if it finds the value' do
      tree = build_tree

      expect(tree.search(46)).to be_truthy
    end

    it 'returns falsey if it does not find the value' do
      tree = build_tree

      expect(tree.search(999)).to be_falsey
    end
  end

  describe '#depth' do
    it 'returns all values in depth-first order' do
      tree = build_tree

      expect(tree.depth).to eq([58, 42, 35, 30, 36, 47, 46, 54])
    end
  end

  describe '#breadth' do
    it 'returns all values in breadth-first order' do
      tree = build_tree

      expect(tree.breadth).to eq([58, 42, 35, 47, 30, 36, 46, 54])
    end
  end

  describe '#insert' do
    it 'returns a new tree with the value inserted' do
      tree = build_tree.insert(40)

      expect(tree.search(40)).to be_truthy
    end

    it 'returns a tree with the other nodes preserved' do
      pending 'Insertion currently only returns the new node'

      tree = build_tree.insert(40).insert(12)

      expect(tree.search(40)).to be_truthy
    end
  end

  def build_tree
    FunctionalTree.new(
      58,
      FunctionalTree.new(
        42,
        FunctionalTree.new(
          35,
          FunctionalTree.new(30, FunctionalTree::Nil.new, FunctionalTree::Nil.new),
          FunctionalTree.new(36, FunctionalTree::Nil.new, FunctionalTree::Nil.new)
        ),
        FunctionalTree.new(
          47,
          FunctionalTree.new(46, FunctionalTree::Nil.new, FunctionalTree::Nil.new),
          FunctionalTree.new(54, FunctionalTree::Nil.new, FunctionalTree::Nil.new)
        )
      ),
      FunctionalTree::Nil.new
    )
  end
end
