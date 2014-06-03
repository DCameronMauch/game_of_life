require_relative 'cell'

class Grid
  def initialize(width, height, density)
    @width = width
    @height = height
    @density = density
    populate
    find_neighbors
  end

  def step
    cells_observe
    cells_evolve
  end

  def to_s
    @grid.map do |row|
      row.map do |cell|
        cell.alive ? '1' : '0'
      end.join
    end.join("\n")
  end

  private

  def populate
    @grid = Array.new(@height).map do
      Array.new(@width).map do
        Cell.new(rand <= @density)
      end
    end
  end

  def find_neighbors
    @grid.each_with_index do |row, yindex|
      row.each_with_index do |cell, xindex|
        cell.neighbors = (-1..1).to_a.product((-1..1).to_a).reduce([]) do |memo, offset|
          unless(offset == [0,0])
            yoffset = (offset[0] + yindex) % @height
            xoffset = (offset[1] + xindex) % @width
            memo.push(@grid[yoffset][xoffset])
          end
          memo
        end
      end
    end
  end

  def cells_observe
    @grid.each do |row|
      row.each do |cell|
        cell.observe
      end
    end
  end

  def cells_evolve
    @grid.each do |row|
      row.each do |cell|
        cell.evolve
      end
    end
  end
end
