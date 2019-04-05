class Allergies
 ALLERGENS = %w{
   eggs
   peanuts
   shellfish
   strawberries
   tomatoes
   chocolate
   pollen
   cats
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(allergen)
    code_matches?(2 ** ALLERGENS.index(allergen))
  end

  def list
    ALLERGENS.select(&method(:allergic_to?))
  end

private

  def code_matches?(bits)
    bits == (bits & @score)
  end
end
