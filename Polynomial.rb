class Polynomial
  @sequence = []
  def initialize(sequence)
    if sequence.length < 2
      p  "Need at least 2 coefficients."
      return
    else
      @sequence = sequence 
    end
    self.createString()
  end

  def createString
    # p "we are in create string #{@sequence}"
    @poly = ""
    poly_length = @sequence.length  
    @sequence.each do |digi|
      poly_length -= 1
      # p digi, poly_length
      # no need to process if the digit is one 
      if digi == 0 
          next 
      end
      if digi < 0
        @poly << "-"
      else 
        if !@poly.empty?
          @poly << "+"
        end
      end

      if digi.abs() != 1
        @poly << "#{digi.abs()}"
      end
      if poly_length > 1
        @poly << "x^#{poly_length}"
      elsif poly_length == 1
         @poly << "x"
      elsif poly_length == 0 
        if digi.abs() == 1
          @poly << "1"
        end
        next
      end
    end
    p @poly
  end
end

nc =   Polynomial.new([-3,-4,1,1,6])
nc =   Polynomial.new([1,0,2])
nc =   Polynomial.new([1,1,1])
nc =   Polynomial.new([2,3,-1])
nc =   Polynomial.new([2,3,0])
nc =   Polynomial.new([2,3,-12])