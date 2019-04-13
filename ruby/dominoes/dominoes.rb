module Dominoes
  def self.chain?(dominoes)
    eulerian?(dominoes) && connected?(dominoes)
  end

  class << self
  private

    def eulerian?(graph_edges)
      nodes_degrees = graph_edges.
        flatten.group_by(&:itself).values.map(&:length)
      nodes_degrees.all?(&:even?)
    end

    def connected?(graph_edges)
      return true if graph_edges.empty?
      head, *tail = graph_edges
      loop do
        brim, tail = tail.partition { |edge| (edge & head).any? }
        return true if tail.empty?
        return false if brim.empty? && tail.any?
        head.concat(brim.flatten).uniq!
      end
    end
  end
end
