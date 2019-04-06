class WordProblem
  OPERATIONS = {
    "plus" => :+,
    "minus" => :-,
    "multiplied by" => :*,
    "divided by" => :/,
  }

  OPERAND = /-?\d+/
  OPERATION_AND_OPERAND = / (#{OPERATIONS.keys.join("|")}) (#{OPERAND})/
  OPENING = /What is (?<operand>#{OPERAND})/
  PHRASING = /\A#{OPENING}(#{OPERATION_AND_OPERAND})+\?\Z/

  def initialize(question)
    @question = question
    @tokens = []
  end

  def answer
    check_phrasing!(@question)
    @tokens = tokenize_question(@question)
    compute_answer(@tokens)
  end

private

  def check_phrasing!(question)
    raise ArgumentError unless question.match?(PHRASING)
  end

  def tokenize_question(question)
    [].tap do |tokens|
      tokens << question.match(OPENING)["operand"].to_i
      question.scan(OPERATION_AND_OPERAND).each do |operation, term|
        tokens << OPERATIONS[operation]
        tokens << term.to_i
      end
    end
  end

  def compute_answer(tokens)
    result = tokens.first
    tokens[1..].each_slice(2) do |operation, term|
      result = result.send(operation, term)
    end
    result
  end
end
