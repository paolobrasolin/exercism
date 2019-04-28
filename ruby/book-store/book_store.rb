module BookStore
  BASE_PRICE = 8
  DISCOUNTS = [0, 0, 5, 10, 20, 25]

  BUNDLE_PRICE = DISCOUNTS.map.with_index.with_object({}) do |(d, i), h|
    h[i] = i * BASE_PRICE * (1 - d.fdiv(100))
  end

  # We sort bundle sizes to know which ones increase
  # the total price the less when adding a book.
  PRIORITIZED_SIZES = (0..4).sort do |i, j|
    [i,j+1].sum(&BUNDLE_PRICE) <=> [i+1,j].sum(&BUNDLE_PRICE)
  end

  def self.calculate_price(basket)
    # We must sort by numerosity to ensure all bundles
    # already exist when choosing for the first time.
    books = basket.group_by(&:itself).values.sort_by(&:length).flatten

    bundles = [[]]
    while book = books.pop
      bundle = bundles.
        reject { |bundle| bundle.include?(book) }.
        max_by { |bundle| PRIORITIZED_SIZES.index(bundle.size) }
      bundles.push([]) if bundle.empty?
      bundle.push(book)
    end

    bundles.map(&:size).sum(&BUNDLE_PRICE)
  end
end