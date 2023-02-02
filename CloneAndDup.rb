require 'SecureRandom'
class Animal
  attr_accessor :name, :dna, :age
 
  def initialize
    self.dna = generate_dna
  end
 
  def initialize_copy(original_animal)
    self.age = 0
    super
  end
 
  def initialize_dup(original_animal)
    self.dna = generate_dna
    self.name = "A new name"
    super
  end
 
  def initialize_clone(original_animal)
    self.name = "#{original_animal.name} 2"
    super
  end
 
  def generate_dna
    SecureRandom.hex
  end

  def to_s
    print(self.dna , self.name , self.age )
  end 
end
 
bello = Animal.new
bello.name = "Bello"
bello.age = 10
 
bello_clone = bello.clone
bello_dup = bello.dup

 

puts  bello_clone

puts bello_dup

puts bello 