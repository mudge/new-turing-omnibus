require 'array_tree'

RSpec.describe ArrayTree do
  describe '#search' do
    it 'prints "Yes" if it finds the name' do
      tree = described_class.new(
        [nil, nil, 37, 29,  51, nil, 55, 53,  62,  49,  5,   nil, 17,  nil],
        [nil, nil, 4,  11,  10, nil, 8,  nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, 5,  nil, 7,  nil, 9,  nil, nil, nil, 13,  nil, nil, nil],
        3
      )

      expect { tree.search(17) }.to output("Yes\n").to_stdout
    end

    it 'prints "No" if it does not find the name' do
      tree = described_class.new(
        [nil, nil, 37, 29,  51, nil, 55, 53,  62,  49,  5,   nil, 17,  nil],
        [nil, nil, 4,  11,  10, nil, 8,  nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, 5,  nil, 7,  nil, 9,  nil, nil, nil, 13,  nil, nil, nil],
        3
      )

      expect { tree.search(999) }.to output("No\n").to_stdout
    end
  end

  describe '#depth' do
    it 'prints the tree in depth-first order' do
      tree = described_class.new(
        [nil, nil, 37, 29,  51, nil, 55, 53,  62,  49,  5,   nil, 17,  nil],
        [nil, nil, 4,  11,  10, nil, 8,  nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, 5,  nil, 7,  nil, 9,  nil, nil, nil, 13,  nil, nil, nil],
        3
      )

      expect { tree.depth }.to output("37\n29\n5\n17\n51\n49\n55\n53\n62\n").to_stdout
    end
  end

  describe '#breadth' do
    it 'prints the tree in breadth-first order' do
      tree = described_class.new(
        [nil, nil, 37, 29,  51, nil, 55, 53,  62,  49,  5,   nil, 17,  nil],
        [nil, nil, 4,  11,  10, nil, 8,  nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, 5,  nil, 7,  nil, 9,  nil, nil, nil, 13,  nil, nil, nil],
        3
      )

      expect { tree.breadth }.to output("37\n29\n51\n5\n49\n55\n17\n53\n62\n").to_stdout
    end
  end
end
