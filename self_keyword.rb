# Self Keyword

# Ruby tiene una palabra reservada que sirve para hacer referencia a un objeto dentro de 
# su definición. Aunque el uso de self cambia dependiendo del contexto en el que se llame.

# Objetivos Académicos
# Comprender el uso de self
# Conocer los tres tipos de contextos en los que puede llamarse
# Actividades
# Lo primero que tienes que comprender es self dentro del contexto global. Escribe lo 
# siguiente en un programa nuevo. Que dice?

# puts "self es igual a: #{self}"
# Todo programa de ruby corre dentro de un objeto llamado main que es automáticamente creado 
# cada vez que el programa es interpretado. Este objeto es el contexto más alto del programa 
# o el top-level namespace.

# Self en tres diferentes contextos
# Ahora conoceremos los tres contextos en los que puedes llamar self dentro de una clase y 
# para que sirven. 
# El primero y algo que seguro no utilizaras es:

# class DummyClass
#   puts "Esto esta corriendo cuando se define la clase"
#   puts "En este contexto self es igual a: #{self}"
# end
# Ahora envolveremos este código dentro de un método. Antes de correrlo, intenta descifrar 
# quien será self ahora? ojo cambiamos parte de la redacción del primer string.

# class DummyClass

#     def intance_method
#         puts "Dentro de un método de instancia"
#         puts "En este contexto self es igual a: #{self}"
#     end
# end

# dummy_class = DummyClass.new()
# puts dummy_class.intance_method
# La representación en un string, de un objeto, por default es el nombre del objeto y una
#  representación encriptada de su id: #<DummyClass:0x007fac92043738>. Por ello podemos ver 
#  que dentro de un método de instancia self se refiere a una instancia especifica de la clase.

# Finalmente nos quedan los class methods. Para definir uno de estos métodos hay 
# que utilizar justamente la palabra self dentro de su nombre para hacer referencia a la
#  clase. Agrega el siguiente método de clase a tu DummyClass.

# class DummyClass

#     def self.class_method
#             puts "Dentro de un método de clase"
#         puts "En este contexto self es igual a: #{self}"
#     end
# end

# dummy_class = DummyClass.new()
# puts DummyClass.class_method   
# Escribe una nota explicando en tus palabras lo que entendiste en este ejercicio.
##################################################################################################################################################################################
puts "self es igual a: #{self}" #Te dice que el self es igual a: main
# Todo programa de ruby corre dentro de un objeto llamado main que es automáticamente creado cada vez que 
# el programa es interpretado. Este objeto es el contexto más alto del programa o el top-level namespace.

# Self en diferentes contextos dentro de una clase
# Self en tres diferentes contextos
# Ahora conoceremos los tres contextos en los que puedes llamar self 
# dentro de una clase y para que sirven. 
# El primero y algo que seguro no utilizaras es:
class DummyClass
  # ------ Self en la clase => DummyClass self es igual al nombre de la clase en donde se encuenta
  puts "Esto esta corriendo cuando se define la clase"
  puts "En este contexto self es igual a: #{self}" # Se imprime que es la clase DummyClass

  #Self en un metodo => #<DummyClass:0x007ff31c95ad50> self es igual al nombre to_s de la clase String y id
    def intance_method
      puts "Dentro de un método de instancia"
      puts "En este contexto self es igual a0: #{self}"# Se imprime que es la clase DummyClass
    end
  # Self en un metodo de clase declarado con self en el nombre del metdo
    def self.class_method
      puts "Dentro de un método de clase"
      puts "En este contexto self es igual a1: #{self}" #<DummyClass:0x007f84ec886a58>
    end
end
dummy_class = DummyClass.new()
puts dummy_class.intance_method
puts DummyClass.class_method 

