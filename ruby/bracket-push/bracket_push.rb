module Brackets
  BRACKETS = /[\(\)\[\]\{\}]/
  NESTINGS = /
    \A
    ( # this is group 1, which matches
      ( \( \g<1> \) # round brackets around group 1
      | \[ \g<1> \] # or square brackets around group 1
      | \{ \g<1> \} # or curly brackets around group 1
      | # or nothing at all to terminate recursion
      )+ # one or more times
    )
    \Z
  /x

  def self.paired?(string)
    string.scan(BRACKETS).join.match?(NESTINGS)
  end
end
