class Crypto
  def initialize(plaintext)
    @plaintext = normalize(plaintext)
    @plaintext_length = @plaintext.length
  end
  
  def ciphertext
    return "" if @plaintext_length.zero?
    rectangle.transpose.map(&:join).join(' ')
  end

private

  def normalize(string)
    string.downcase.gsub(/\W/, '')
  end

  def rectangle
    width, height = rectangle_sizes
    @plaintext.ljust(width*height, ' ').chars.each_slice(width).to_a
  end

  def rectangle_sizes
    width = Math.sqrt(@plaintext_length).ceil
    height = @plaintext_length.fdiv(width).ceil
    [width, height]
  end
end
