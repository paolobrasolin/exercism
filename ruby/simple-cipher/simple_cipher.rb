class Cipher
  KEY_FORMAT = /\A[a-z]+\Z/

  attr_reader :key

  def initialize(key=random_key)
    raise ArgumentError unless key.match?(KEY_FORMAT)
    @key = key
    @cyclic_key_offsets = to_offsets(@key).cycle
  end

  def encode(plaintext)
    zip_with_key_offsets_injecting(plaintext, :+)
  end

  def decode(ciphertext)
    zip_with_key_offsets_injecting(ciphertext, :-)
  end

private

  def random_key
    100.times.collect{ rand(97..122).chr }.join
  end

  def zip_with_key_offsets_injecting(string, injected_method)
    to_offsets(string).
      zip(@cyclic_key_offsets).
      map { |l| l.inject(injected_method) }.
      yield_self(&method(:to_string))
  end

  def to_offsets(string)
    string.chars.map { |char| char.ord - 97 }
  end

  def to_string(offsets)
    offsets.map { |offset| (offset % 26 + 97).chr }.join
  end
end
