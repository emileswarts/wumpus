class Cave
  attr_accessor :rooms

  ADJACENT_ROOMS = {
    1 => [2, 5, 8],
    2 => [1, 3, 10],
    3 => [2, 4, 12],
    4 => [3, 5, 14],
    5 => [1, 4, 6],
    6 => [5, 7, 15],
    7 => [6, 8, 17],
    8 => [1, 7, 11],
    9 => [10, 12, 19],
    10 => [2, 9, 11],
    11 => [8, 10, 20],
    12 => [3, 9, 13],
    13 => [12, 14, 18],
    14 => [4, 13, 15],
    15 => [6, 14, 16],
    16 => [15, 17, 18],
    17 => [7, 16, 20],
    18 => [13, 16, 19],
    19 => [9, 18, 20],
    20 => [11, 17, 19]
  }

  def initialize
    @rooms = Array.new(14) { { type: :empty } }

    @rooms.concat(bats)
    @rooms.concat(bottomless_pits)
    @rooms.concat(wumpus)
    @rooms.concat(player)

    add_adjacent_rooms!
    calculate_

    puts @rooms
  end

  private

  def add_adjacent_rooms!
    @rooms.map.with_index do |room, index|
      room[:adjacent_rooms] = Set.new(ADJACENT_ROOMS[index + 1])
    end
  end

  def wumpus
    [{ type: :wumpus } ]
  end

  def player; [ {type: :player} ]; end

  def bats
    Array.new(2) do
      { type: :bats }
    end
  end

  def bottomless_pits
    Array.new(2) do
      { type: :bottomless_pit }
    end
  end
end


# [
#   { type: :bats }
#   { type: :wumpus }
#   { type: :empty }
# ]
