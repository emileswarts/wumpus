require 'set'
require_relative '../lib/cave'

describe 'Cave' do
  it 'has 20 rooms' do
    expect(Cave.new.rooms.count).to eq(20)
  end

  it 'one room has a player' do
    cave = Cave.new

    expect(cave.rooms.select do |room|
       room[:type] == :bats
    end.count).to eq(2)

    expect(cave.rooms.select do |room|
       room[:type] == :bottomless_pit
    end.count).to eq(2)

    expect(cave.rooms.select do |room|
       room[:type] == :wumpus
    end.count).to eq(1)

    expect(cave.rooms.select do |room|
       room[:type] == :player
    end.count).to eq(1)

  end

  it 'has adjacent rooms' do
    cave = Cave.new

    expect(cave.rooms[0].fetch(:adjacent_rooms)).to eq(Set.new([2, 5, 8]))
  end
end
