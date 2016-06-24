
# Regresar a Challenges

# Gallinita Ponedora

# Vamos a crear un programa que modele a un granjero que recoge huevos de gallinas ponedoras. 
# Este será un sistema que contendrá dos tipos de objetos: Huevo(Egg) y Gallina 
# Ponedora(LayingHen).

# # Objetivos Académicos
# Practicar el concepto de scope
# Practicar el uso de attr_reader/writer/accessor methods
# Recursos Externos
# Video: Variable Scopes in Ruby
# StackOverflow: What is attr_accessor in Ruby?
# StackOverflow: Why use Ruby's attr_accessor, attr_reader, and attr_writer?
# Actividades
# Abajo encontraras una estructura de código y comentarios que deberás seguir 
# para crear este programa. Adicionalmente encontraras driver code, que deberás 
# usar como una guía para que funcione tu programa.

# class LayingHen

#   def initialize
#   end

#   # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
#   def age!
#   end

#   # Returns +true+ if the hen has laid any eggs, +false+ otherwise
#   def any_eggs?
#   end

#   # Returns an Egg if there are any
#   # Raises a NoEggsError otherwise
#   def pick_an_egg!
#     raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?

#     # egg-picking logic goes here
#   end

#   # Returns +true+ if the hen can't laid eggs anymore because of its age, +false+ otherwise.
#   # The max age for a hen to lay eggs is 10 
#   def old?
#   end

#   def increase_hatched_hour(hours)
#   end
# end

# class Egg
#   # Initializes a new Egg with hatched hours +hatched_hours+
#   def initialize
#   end

#   # Return +true+ if hatched hours is greater than 3, +false+ otherwise
#   def rotten?
#   end
# end


# hen = LayingHen.new
# basket = []
# rotten_eggs = 0

# hen.age! until hen.any_eggs?

# puts "Hen is #{hen.age} months old, its starting to laid eggs."
# puts ""

# until hen.old?

#   # The time we take to pick up the eggs
#   hours = rand(5)
#   hen.increase_hatched_hour(hours)

#   while hen.any_eggs?
#     egg = hen.pick_an_egg!

#     if egg.rotten?
#       rotten_eggs += 1
#     else
#       basket << egg
#     end
#   end

#   puts "Month #{hen.age} Report"
#   puts "We took #{hours} hour(s) to pick the eggs"
#   puts "Eggs in the basket: #{basket.size}"
#   puts "Rotten eggs: #{rotten_eggs}"
#   puts ""

#   # Age the hen another month
#   hen.age!
# end

# puts "The hen is old, she can't laid more eggs!"
# puts "The hen laid #{basket.size + rotten_eggs} eggs"
# if rotten_eggs == 0
#   puts "CONGRATULATIONS NO ROTTEN EGGS" 
# else
#   puts "We pick to late #{rotten_eggs} eggs so they become rotten"
# end
################################################################################################################################################################################################################
#varibla que llevara las horas y podra ser cambiada
$hatched_hours = 0
#class para saber recoger los huevos que ponga la gallina
class LayingHen
  #darle permisos a age y canaste
  attr_accessor :age
  attr_reader :canasta
  #variables a inicializar
  def initialize
    #variable de instancia age
    @age = 0
    #variables de instancia canasta
    @canasta = []
  end

  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
  def age!
    #aumenta la edad
    @age += 1
    #si la edad es mayor a 3 la gallina pone 4 objetos huevo
    if @age > 3
      4.times do
        @canasta << Egg.new 
      end
    end
  end

  # Returns +true+ if the hen has laid any eggs, +false+ otherwise
  def any_eggs?
    #si la canasta tiene mas de 0 huevos
    if @canasta.length > 0
      #regresa true
      true
      #de lo contrario
    else
      #regresa false
      false
    end
  end

  # Returns an Egg if there are any
  # Raises a NoEggsError otherwise
  def pick_an_egg!
    #a menos de que haya huevos levanta el mensaje
      raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?
      # egg-picking logic goes here
      #agarra el primer objeto egg de la canasta y lo guarda
      a = @canasta.shift
  end
  # Returns +true+ if the hen can't laid eggs anymore because of its age, +false+ otherwise.
  # The max age for a hen to lay eggs is 10 
  def old?
    #si la gallina tiene mas de 10 meses
    if @age > 10
      #regresa true
      true
      #de lo contrario regresa false
    else
      false
    end
  end
  #incrementa las horas en el parametro que le de el usuario
  def increase_hatched_hour(hours)
    #cambia el valor de las horas por las que inserte el usuario
    $hatched_hours = hours
  end
end
#clase Egg
class Egg
  # Initializes a new Egg with hatched hours +hatched_hours+
  #no se inicializa nada
  def initialize
  end

  # Return +true+ if hatched hours is greater than 3, +false+ otherwise
  def rotten?
    #si las horas son mayores a 3
    if $hatched_hours > 3
      #regresa true
      true
      #de lo contrario
    else
      #regresa false
      false
    end
  end
end

# DRIVER CODE
hen = LayingHen.new
basket = []
rotten_eggs = 0

hen.age! until hen.any_eggs?

puts "Hen is #{hen.age!} months old, its starting to laid eggs."
puts ""

until hen.old?

  # The time we take to pick up the eggs
  hours = rand(5)
  hen.increase_hatched_hour(hours)

  while hen.any_eggs?
    egg = hen.pick_an_egg!
    #p egg.rotten?
    if egg.rotten? 
      rotten_eggs += 1
    else
      basket << egg
    end
  end

  puts "Month #{hen.age} Report"
  puts "We took #{hours} hour(s) to pick the eggs"
  puts "Eggs in the basket: #{basket.size}"
  puts "Rotten eggs: #{rotten_eggs}"
  puts ""

  #Age the hen another month
  hen.age!
end

puts "The hen is old, she can't laid more eggs!"
puts "The hen laid #{basket.size + rotten_eggs} eggs"
if rotten_eggs == 0
  puts "CONGRATULATIONS NO ROTTEN EGGS" 
else
  puts "We pick to late #{rotten_eggs} eggs so they become rotten"
end