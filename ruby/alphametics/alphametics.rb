module Alphametics
  def self.solve(formula)
    vars_list = formula.scan(/\p{Lu}/).uniq
    vars_count = vars_list.size
    vars_string = vars_list.join
    leading_vars = formula.scan(/\b\p{Lu}/).uniq
    leading_idcs = leading_vars.map { |v| vars_list.index(v) }

    (0..9).to_a.permutation(vars_count) do |valuation|
      next if leading_idcs.any? { |i| valuation[i].zero? }
      interpolated_formula = formula.
        tr(vars_string, valuation.map(&:to_s).join)
      return vars_list.zip(valuation).to_h if eval(interpolated_formula)
    end
    {}
  end
end
