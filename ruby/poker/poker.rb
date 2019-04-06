class Poker
  class Card
    RANKS = %w{2 3 4 5 6 7 8 9 10 J Q K A}
    SUITS = %w{H D C S}
    NOTATION = /
      \A
      (?<rank>(#{RANKS.join("|")}))
      (?<suit>(#{SUITS.join("|")}))
      \Z
    /ix

    attr_reader :rank, :suit

    def initialize(rank:, suit:)
      @rank = RANKS.index(rank)
      @suit = SUITS.index(suit)
    end

    def to_notation
      "#{RANKS[@rank]}#{SUITS[@suit]}"
    end

    def self.from_notation(notation)
      match = NOTATION.match(notation)
      new(rank: match[:rank], suit: match[:suit])
    end
  end

  class Hand
    include Comparable

    def initialize(cards)
      @cards = cards
    end

    def to_notations
      @cards.map(&:to_notation)
    end

    def self.from_card_notations(notations)
      new(notations.map(&Card.method(:from_notation)))
    end

    def <=>(hand)
      score.values <=> hand.score.values
    end

  protected

    def score
      @score ||= {
        straight_flush: straight_flush,
        four_of_a_kind: four_of_a_kind,
        full_house: full_house,
        flush: flush,
        straight: straight,
        three_of_a_kind: three_of_a_kind,
        two_pairs: two_pairs,
        one_pair: one_pair,
        high_card: high_card,
      }
    end

  private

    def one_pair
      ranks = ranks_in_groups_of(2)
      ranks.one? ? ranks.first : -1
    end

    def two_pairs
      ranks = ranks_in_groups_of(2)
      ranks.length == 2 ? ranks.sort.reverse : []
    end

    def three_of_a_kind
      ranks_in_groups_of(3).first || -1
    end

    def straight
      return 5 if ranks.sort == [0, 1, 2, 3, 12]
      ranks.sort == (ranks.min..ranks.max).to_a ? ranks.max : -1
    end

    def flush
      suits.uniq.one? ? ranks.max : -1
    end

    def full_house
      fh_score = [three_of_a_kind, one_pair]
      fh_score.none?(&:negative?) ? fh_score : [-1, -1]
    end

    def four_of_a_kind
      ranks_in_groups_of(4).first || -1
    end

    def straight_flush
      suits.uniq.one? ? straight : -1
    end

    def high_card
      ranks.minmax.reverse
    end

    def ranks_in_groups_of(size)
      ranks.select { |rank| ranks.count(rank) == size }.uniq
    end

    def ranks
      @cards.map(&:rank)
    end

    def suits
      @cards.map(&:suit)
    end
  end

  def initialize(hands)
    @hands = hands.map(&Hand.method(:from_card_notations))
  end

  def best_hand
    sorted_hands = @hands.sort
    sorted_hands.
      drop_while { |hand| hand < sorted_hands.last }.
      map(&:to_notations)
  end
end
