class Cell
  attr_writer :neighbors
  attr_reader :alive

  def initialize(alive)
    @alive = alive
    @neighbors = []
    @count = 0
  end

  def observe
    @count = @neighbors.reduce(0) do |memo,cell|
      memo += 1 if(cell.alive)
      memo
    end
  end

  def evolve
    @alive = ((@alive and @count == 2) or @count == 3)
  end
end
