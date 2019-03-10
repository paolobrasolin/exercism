class Affine
  ALPHABET = ('a'..'z').to_a
  ALPHABET_LENGTH = ALPHABET.length
  ALLOWED_CHARS = /[#{ALPHABET.join}0-9]/
  CHUNKS_LENGTH = 5

  def initialize(a, b)
    raise ArgumentError.new("first argument and #{ALPHABET_LENGTH} must be coprime") if a.gcd(ALPHABET_LENGTH) != 1
    @a = a
    @b = b
    @i = modular_multiplicative_inverse(a, ALPHABET_LENGTH)
  end

  def encode(plaintext)
    endcoded_chars = list_allowed_chars(plaintext).map(&method(:encode_char))
    endcoded_chars.each_slice(CHUNKS_LENGTH).map(&:join).join(" ")
  end

  def decode(ciphertext)
    decoded_chars = list_allowed_chars(ciphertext).map(&method(:decode_char))
    decoded_chars.join
  end

private

  def list_allowed_chars(string)
    string.downcase.scan(ALLOWED_CHARS)
  end

  def encode_char(letter)
    x = ALPHABET.index(letter)
    return letter if x.nil?
    y = (@a*x + @b) % ALPHABET_LENGTH
    ALPHABET[y]
  end

  def decode_char(letter)
    y = ALPHABET.index(letter)
    return letter if y.nil?
    x = @i * (y - @b) % ALPHABET_LENGTH
    ALPHABET[x]
  end

  def modular_multiplicative_inverse(a, mod)
    (0..mod).detect { |k| a * k % mod == 1 }
  end
end