require 'array_tree'

RSpec.describe ArrayTree do
  describe '#search' do
    it 'returns the node if it finds the name' do
      tree = build_tree

      expect(tree.search(17)).to eq(12)
    end

    it 'returns nil does not find the name' do
      tree = build_tree

      expect(tree.search(999)).to be_nil
    end
  end

  describe '#depth' do
    it 'prints the tree in depth-first order' do
      tree = build_tree

      expect { tree.depth }.to output("37\n29\n5\n17\n51\n49\n55\n53\n62\n").to_stdout
    end
  end

  describe '#breadth' do
    it 'prints the tree in breadth-first order' do
      tree = build_tree

      expect { tree.breadth }.to output("37\n29\n51\n5\n49\n55\n17\n53\n62\n").to_stdout
    end
  end

  describe '#insert' do
    it 'adds a new node to the tree' do
      tree = build_tree
      tree.insert(2)

      expect(tree.search(2)).to eq(14)
    end

    it 'gracefully ignores existing nodes' do
      tree = build_tree
      tree.insert(37)

      expect(tree.search(37)).to eq(2)
    end
  end

  def build_tree
    described_class.new(
      [nil, nil, 37, 29,  51, nil, 55, 53,  62,  49,  5,   nil, 17,  nil],
      [nil, nil, 3,  10,  9,  nil, 7,  nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, 4,  nil, 6,  nil, 8,  nil, nil, nil, 12,  nil, nil, nil],
      2
    )
  end
end

