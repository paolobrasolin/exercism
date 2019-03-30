class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def ==(c)
    real == c.real && imaginary == c.imaginary
  end

  def *(c)
    self.class.new(
      real * c.real - imaginary * c.imaginary,
      real * c.imaginary + imaginary * c.real)
  end

  def /(c)
    self * c.conjugate * self.class.new(c.abs**-2, 0)
  end

  def +(c)
    self.class.new(
      real + c.real,
      imaginary + c.imaginary)
  end

  def -(c)
    self.class.new(
      real - c.real,
      imaginary - c.imaginary)
  end

  def abs
    Math.sqrt([real, imaginary].sum { |p| p**2 })
  end

  def conjugate
    self.class.new(
      real,
      -imaginary)
  end

  def exp
    self.class.new(
      Math.exp(real) * Math.cos(imaginary), 
      Math.exp(real) * Math.sin(imaginary))
  end
end
