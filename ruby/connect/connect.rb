require 'byebug'

Cell = Struct.new(:x, :y, :kind, :connected)

class Board
  def initialize(input)
    @rows = input.map(&:split)
  end

  def winner
    @rows.map!.with_index do |row, i|
      row.map!.with_index do |col, j|
        Cell.new(j, i, col).tap do |cell|
          neighbors = [
            (@rows[i-1][j+1] if i.positive?),
            (@rows[i-1][j  ] if i.positive?),
            (@rows[i  ][j-1] if j.positive?),
          ].compact.select { |n| n.kind == cell.kind }

          # Definitely far from an optimal algorithm, but...
          component = neighbors.map(&:connected).flatten.uniq
          cell.connected = [cell, *component]
          component.each { |neighbor| neighbor.connected = cell.connected }
        end
      end
    end

    return "X" if is_spanning(@rows.transpose, "X", :x)
    return "O" if is_spanning(@rows, "O", :y)
    ""
  end

private

  def is_spanning(rows, kind, coord_method)
    rows.first.select { |c| c.kind == kind }.any? do |a|
      a.connected.map(&coord_method).minmax == [0, rows.size-1]
    end
  end
end
