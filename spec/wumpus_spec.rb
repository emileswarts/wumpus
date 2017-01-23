require 'set'
require_relative '../lib/cave'

describe 'Cave' do
  it 'has 20 rooms' do
    expect(Cave.new.rooms.count).to eq(20)
  end

  it 'two rooms have bats' do
    expect(Cave.new.rooms.select do |room|
       room[:type] == :bats
    end.count).to eq(2)
  end

  it 'two rooms have bottomless pits' do
    expect(Cave.new.rooms.select do |room|
       room[:type] == :bottomless_pit
    end.count).to eq(2)
  end

  it 'one room has a wumpus' do
    expect(Cave.new.rooms.select do |room|
       room[:type] == :wumpus
    end.count).to eq(1)
  end

  it 'has adjacent rooms' do
    cave = Cave.new

    expect(cave.rooms[0].fetch(:adjacent_rooms)).to eq(Set.new([2, 5, 8]))
  end
end
