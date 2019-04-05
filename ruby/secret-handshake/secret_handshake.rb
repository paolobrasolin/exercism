class SecretHandshake
  REVERSAL_BITS = 16
  COMMANDS_BITS = {
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump",
  }

  def initialize(code)
    @code = code.to_i
  end

  def commands
    ordered_commands
  end

private

  def matched_commands
    COMMANDS_BITS.select { |bits, _| code_matches?(bits) }.values
  end

  def ordered_commands
    if code_matches?(REVERSAL_BITS)
      matched_commands.reverse
    else
      matched_commands
    end
  end

  def code_matches?(bits)
    bits == (bits & @code)
  end
end
