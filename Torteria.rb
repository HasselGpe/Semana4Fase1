# Torteria

# Un amigo acaba de abrir un negocio de Tortas y se le están quemando.
# Ayúdale a crear un programa para administrar el tiempo de horneado de los diferentes tipos de tortas.

# El cocinero (user stories):

# Necesita preparar diferentes tipos de tortas.
# Necesita meter las tortas por lotes al horno.
# Y lo más importante saber cuando sacarlas.
# En este ejercicio debes buscar que el diseño de tu código siga el principio de 
# "Single Responsibility" (SRP). Esta vez no sólo en los métodos sino también en las clases.

# SRP es una de las reglas descritas por Uncle Bob (Robert Martin) con el objetivo de 
# que al hacer cambios en tu código modifiques el menor número de partes.

# Esto genera que el costo de mantenimiento sea muy bajo.

# Objetivos Académicos
# Practicar:

# Programación orientada a objetos.
# Relación entre clases.
# El principio de "Single Responsability".
# Actividades
# Diseñar un MVP
# ¿Qué clases crees que sean necesarias?
# ¿Qué atributos deben tener las clases?
# ¿Cuál es el comportamiento necesario para cada una?
# ¿Cómo van a interactuar las clases entre ellas?
# ¿Cómo divides el código para que cada clase y método tenga una única responsabilidad?
# Finalmente debes de tener una idea general de cuáles son los features indispensables 
# para crear el MVP.

# Te recomendamos que empieces creando la funcionalidad para que puedas meter y sacar tortas 
# del horno.

# Paso 2
# Piensa en cómo puedes hacer para meter varias tortas con tiempos diferentes de horneado.

# Implementa una manera para saber en que etapa del horneado se encuentra cada tipo de
#  torta. Puedes usar los siguientes estados: crudo, casi listo, listo y quemado.

# Paso 3: Refactorizar
# Vuelve a leer tu código y revisa que siga los siguientes principios:

# ¿Tu código es DRY?
# ¿Tus clases siguen la Ley de Demeter?
# ¿Tus clases son ortogonales?
# ¿Estás definiendo correctamente tus métodos públicos y privados?
# En resumen la Ley de Demeter es:

# Usar métodos de los objetos que llegaron como argumentos del mismo método.
# Usar métodos de los objetos que se definieron como variables de la clase.
# Usar métodos de los objetos que se definieron como variables locales dentro del método.
# Ponte creativo y expande tu programa
# Imagínate que otras características pudieras necesitar en una tortería.
#############################################################################################################################
class Tortas
  attr_accessor :tiempo_cocinado, :torta, :numero_tortas, :tipo_tortas
  def initialize(torta, tiempo_cocinado)
    @torta = torta
    @tiempo_cocinado = tiempo_cocinado
  end
end
class Batch
  attr_accessor :tiempo_cocinado
  def initialize(numero_tortas, tipo_tortas, tiempo_cocinado)
    @batch_tortas = []
    @tiempo_cocinado = tiempo_cocinado
    @numero_tortas = numero_tortas
    @tipo_tortas = tipo_tortas
  end
  def torta_cocinando
    for i in 0..@numero_tortas - 1
      @batch_tortas << Tortas.new(@tipo_tortas, @tiempo_cocinado)
    end
    @batch_tortas
  end
end
class Horno
  attr_accessor :time
  def initialize(batch_tortas)
    @batch_tortas = batch_tortas
    @time = rand(1..10)
  end
  def Cocinado
    @reporte = []
    for i in 0..@batch_tortas.length - 1
      if @time > 0 && @time < 3
        @reporte << "Cruda #{@batch_tortas[i].torta}"
      elsif @time >= 3 && time < 7
        @reporte << "La torta no esta lista #{@batch_tortas[i].torta}"
      elsif @time >= 7 && @time <= 10
        @reporte << "La torta esta lista #{@batch_tortas[i].torta}"
        else
          @reporte << "Se quemo la torta :C #{@batch_tortas[i].torta}" 
      end
      @time = rand(1..20)
    end
    @reporte
end
  def reporte_tortas
    crudas = 0
    casi_lista = 0
    lista = 0
    quemada = 0 
    @reporte.each do |torta|
      if torta.include? "Cruda"
        crudas += 1
      elsif torta.include? "no esta lista"
        casi_lista += 1
      elsif torta.include? "esta lista"
        lista += 1
      elsif torta.include? "Se quemo"
        quemada += 1
      end   
    end
    puts "*" * 64
    puts "|-------------------------- Pedidos ---------------------------|"
    puts "*" * 64
    puts "La tortas que se pidieron fueron #{@tipo_tortas}"
    puts "Total de tortas: #{crudas + casi_lista + lista + quemada}"
    puts "Quemadas: #{quemada}"
    puts "Crudas: #{crudas}"
    puts "Casi listas: #{casi_lista}"
    puts "Listas: #{lista}"
  end
end
bandeja_tortas = Batch.new(30, "Pollo", 10)
bandeja_tortas_cubanas = Batch.new(28, "Cubana", 15)
bandeja_tortas_jamon= Batch.new(21, "Jamon", 13)
bandeja2 = bandeja_tortas_cubanas.torta_cocinando
bandeja1 = bandeja_tortas.torta_cocinando
bandeja3 = bandeja_tortas_jamon.torta_cocinando
horno = Horno.new(bandeja1 + bandeja2 + bandeja3)
horno.Cocinado
horno.reporte_tortas







