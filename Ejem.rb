#Para definir una variable global se le pone el simbolo de $
$local_var = "This is my local var"
$global_var = "This is a global variable"
CONSTANT = 3.1416
class DummyClass# Se cre una clase llamada DummyClass 
  attr_accessor :new_var#, :@instance_var
  @@class_variable = "This is a class variable"
  #Si se quiere que el usuario ponga algo se debe declarar
  #la variable
  def initialize(new_var)
    @new_var = new_var
    #si el usuario no vera las otras variables no se declaran
    @instance_var = $local_var
  end
  
  def return_my_local_var
    #siempre que se quiera llamar una variable globar se debe llamar
    #con el simbolo $
    $local_var = new_var
    #Se puede sobreescribir y siempre que se llame la variable
    #tendra el valor nuevo
    #$local_var = "this is other method"
  end

  # Este es un getter
  def instance_var
    @instance_var
  end

  # Este es un setter
  def instance_var=(value)
    @instance_var = value
  end

  def class_var
    @@class_variable
  end

  def class_var=(value)
    @@class_variable = value
  end

  def constant
    CONSTANT
  end
  #como es constante no se puede sobreescribir el valor
  #ruby no te deja
  # def constant=(value)
  #   CONSTANT = value
  # end
  #es un get
  def global_var
    $global_var
  end
  #establece nuevo valor a la variable $global var
  #es un set
  def global_var=(value)
    $global_var = value
  end
end
#instancia de la clase dummy
dummy = DummyClass.new("Hello, how are you?")
puts dummy.return_my_local_var #Se crea una instancia de la clase DummyClass y mandamos a llamar su metodo (con puts y ver que pasa)
puts dummy.instance_var
puts dummy.instance_var=("Bye")
puts dummy.instance_var=("Bar")
puts dummy.instance_var   =    "Baz"
dummy_1 = DummyClass.new("Little Mix")
dummy_2 = DummyClass.new("Melody")
puts dummy_1.class_var=("New value for the class variable")
puts dummy_2.class_var=("5h")
puts dummy_1.constant
#no se puede sobreescribir una constante
#puts dummy_1.constant=(4)
puts dummy.global_var
puts dummy.global_var=("Global")