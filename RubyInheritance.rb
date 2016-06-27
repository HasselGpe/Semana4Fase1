# Ruby Inheritance 

# Inheritance(herencia) es la relación entre dos classes. Sabemos que todos los 
# gatos son mammmals, y todos los mammals son animales. Los beneficios de la 
# inheritance(herencia) es que las clases de jerarquia mas baja puede obtener las 
# caracteristicas de los de arriba, sino que tambien puend añadir caracteristicas propias. 
# Si todos los mammals respiran, entonces todos los gatos respiran.En ruby, una 
# clase puede solamente heredar por una sola clase. Algunos otros lenguajes apoyan 
# la multiple herencia, Un rasgo wue permite a classes para heredar rasgos de multiples 
# clases, pero en ruby no apoya esto.
# Podemos expresar este concepto en Ruby - Ve el programa p033mammal.rb:
class Mammal  
  def breathe  
    puts "inhale and exhale"  
  end  
end  
  
class Cat < Mammal  
  def speak  
    puts "Meow"  
  end  
end  
  
rani = Cat.new  
rani.breathe  
rani.speak  

# CodeaCamp03s-Mac-mini:Semana 4 codea_mac_03$ ruby RubyInheritance.rb 
# inhale and exhale
# Meow
# Aunque nosotros no especificáramos como un Gato debería respirar, cada gato heredará 
# aquel comportamiento de la clase de Mamífero ya que el Gato fue definido como 
# una subclase de Mamífero. 
# La subclas a veces también saben como una clase derivada o infantil y la superclase
# como la clase baja o paternal). De ahí del punto de vista de un programador, los 
# gatos consiguen la capacidad de respirar gratis; después de que añadimos un método 
# hablar, nuestros gatos pueden ambos respirar y hablar.
# Habrá situaciones donde  ciertas propiedades de la superclase no deberían ser
# heredadas por una subclase particular. Aunque los pájaros generalmente sepan volar,
# los pingüinos son una subclase incapacitada para volar de pájaros. En el ejemplo
# p034bird.rb debajo, anulamos eso en la clase Pingüino.
class Bird  
  def preen  
    puts "I am cleaning my feathers."  
  end  
  def fly  
    puts "I am flying."  
  end  
end  
  
class Penguin < Bird  
  def fly  
    puts "Sorry. I'd rather swim."  
  end  
end  
  
p = Penguin.new  
p.preen  
p.fly  

# Más que exhaustivamente definen cada característica de cada nueva clase, tenemos que
# sólo añadir o redefinir las diferencias entre cada subclase y su superclase. A veces
# llaman este empleo de herencia el programa diferencial. Esto es una de las ventajas
# de programa mediante objetos.
# Los dos  programas son tomados de Ruby User's Guide. (http://www.rubyist.net/~slagell/ruby/inheritance.html) Así, 
# la Herencia le permite para crear una clase que es un refinamiento o la especialización
#  de otra clase. La herencia es indicada con <. Aquí está otro ejemplo, p035inherit.rb
class GF  
 def initialize  
  puts 'In GF class'  
 end  
 def gfmethod  
  puts 'GF method call'  
 end  
end  
  
# class F sub-class of GF  
class F < GF  
 def initialize  
  puts 'In F class'  
 end  
end  
  
# class S sub-class of F  
class S < F  
 def initialize  
  puts 'In S class'  
 end  
end  
son = S.new  
son.gfmethod  
# Una clase sólo puede heredar de una clase a la vez (p. ej. una clase puede heredar de 
# una clase que hereda de otra clase que hereda de otra clase, pero una clase sola
# no puede heredar de muchas clases inmediatamente).  

# Hay muchas clases y los módulos (más sobre esto más tarde) incorporaron en la lengua
# estándar De ruby. Ellos están disponibles a cada programa De ruby automáticamente; 
# no require requieren. Algunas clases son: rray, Bignum, Class, Dir, Exception, File, 
# Fixnum, Float, Integer, IO, Module, Numeric, Object, Range, String, Thread, Time. 
# Algunos modules son comparables con Enumerable, GC, Kernel, Math.           

# La clase BasicObject es la clase paternal de todas las clases en ruby. Sus métodos 
# están por lo tanto disponibles a todos los objetos a no ser que explícitamente 
# anulado. Antes en ruby 1.9, la clase de Objeto era la raíz de la jerarquía de clase. 
# La nueva clase BasicObject sirve aquel objetivo, y el Objeto es una subclase de 
# BasicObject. BasicObject no es una clase muy simple, con casi ningun método 
# propio. Cuando creas una clase en Ruby, amplías el Objeto a no ser 
# que explícitamente especifiques la superclase, y la mayor parte de programadores
# nunca tendrán que usar o ampliar BasicObject. En Ruby, initialize es un método
# ordinario y es heredado como cualquier otro.
# Inheritance and Instance Variables

# Consider the code:
class Dog  
  def initialize(breed)  
    @breed = breed  
  end  
end  
  
class Lab < Dog  
  def initialize(breed, name)  
    super(breed)  
    @name = name  
  end  
  
  def to_s  
    "(#@breed, #@name)"  
  end  
end  
  
puts Lab.new("Labrador", "Benzy").to_s  

# Cuando tu invocas super con argumentos, Ruby manda un mensage al padre del objeto 
# corriente, pidiéndolo invocar un método del mismo nombre que el método que invoca 
# súper. súper envía exactamente aquellos argumentos. El método to_s en la clase el
# Laboratorio se refiere la variable @breed del Perro de superclase. Este código trabaja 
# como usted probablemente lo espera:

puts Lab.new("Labrador", "Benzy").to_s #==> (Labrador, Benzy)  

# Porque este código se comporta como SE espera, pueden tentarle decir que estas variables 
# son heredadas. No es como Ruby trabaja. Todos los objetos De ruby tienen un juego 
# de variables de caso. Estos no son definidos por la clase de los objetos - ellos 
# simplemente son creados cuando un valor les es asignado. Como las variables de caso 
# no son definidas por una clase, ellos son sin relaciones a la subclasificación y el 
# mecanismo de herencia. En el  código, el Lab define un método 
# initialize que encadena al método initialize de su superclase. El método encadenado 
# asigna valores a la variable @breed, que hace aquellas variables nacer para un caso 
# particular de Lab.

# La razón que ellos a veces aparecen ser heredados es aquellas variables de caso son 
# creados por los métodos que primero les asignan valores, y aquellos métodos a menudo
# son heredados o encadenados. Ya que las variables de caso no tienen nada que ver con
# la herencia, se sigue que una variable de caso usada por una subclase no puede 
# "la sombra" una variable de caso en la superclase. Si una subclase usa una variable 
# de caso con el mismo nombre que una variable usada por uno de sus antepasados, esto
# superpondrá el valor de la variable de su antepasado.


