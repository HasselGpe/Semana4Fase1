#Creacion clase tortas
class Tortas
  #el usuario podra ver los valores de las siguientes variables
  attr_accessor :time_cook, :torta, :num_tortas, :type_torta
  #metodo que inicizializara estas varibles
  #cada vez que se cree un objeto de la clase tortas debe tener
  #tipo de torta y tiempo a cocinar
  def initialize(torta, time_cook)
    @torta = torta
    @time_cook = time_cook
  end

end
#creacion clase batch para poner las tortas en una bandeja
class Batch
  #el usuario podra acceder a estos valores
  attr_accessor :time_cook
  #Metodo que correra cada vez que el usuario quiera una bandeja con tortas
  #debe ingresar el numero de tortas, tipo de torta y el tiempo que quiere cocinar esas tortas
  def initialize(num_tortas, type_torta, time_cook)
    #array vacio para meter las tortas
    @batch_tortas = []
    @time_cook = time_cook
    #@batch = batch
    @num_tortas = num_tortas
    @type_torta = type_torta
  end
  #metodo para meter las tortas a la bandeja
  def torta_to_batch
    #iterar desde el 0 hasta el numero de tortas que pida para meterlas
    for i in 0..@num_tortas - 1
      #mete objetos tipo torta a el array batch_tortas
      @batch_tortas << Tortas.new(@type_torta, @time_cook)
    end
    #regresa el array tortas
    @batch_tortas
  end

end
#creacion class horno para cocinar las tortas
class Horno
  #dejar al usuario acceder a el timpo
  attr_accessor :time
  #inicialize para pedir al usuario siempre un array con tortas para cocinarlas
  def initialize(batch_tortas)
    @batch_tortas = batch_tortas
    #hacer un tiempo aleatorio para calentar las tortas
    @time = rand(1..10)
  end
  #metodo para cocinar la bandeja de tortas
  def cook_batch
    #array vacio para saber como quedo la torta
    @reporte = []
    #iterar dentro de cada torta
    for i in 0..@batch_tortas.length - 1
      # p @batch_tortas[i].torta
      # p @batch_tortas[i].time_cook
      # condicion para saber si la torta estuvo de 0 a 3 minutos
      if @time > 0 && @time < 3
        #mete a el array report que esta cruda
        @reporte << "Cruda #{@batch_tortas[i].torta}"
      #condicion para saber si la torta estuvo entre 3 y 6 minutos
      elsif @time >= 3 && time < 7
        #dice que la torta esta casi lista
        @reporte << "La torta no esta lista #{@batch_tortas[i].torta}"
        #condicion para saber si la torta estuvo entre  y 10 minutos
      elsif @time >= 7 && @time <= 10
        #dice que la torta estuvo lista
        @reporte << "La torta esta lista #{@batch_tortas[i].torta}"
        #si la torta se paso de 10 minutos
        else
          #dice que la torta se quemo
          @reporte << "Se quemo la torta :C #{@batch_tortas[i].torta}" 
      end
      #cada vez que vuelve a entrar cambia el valor del tiempo que estara la torta
      @time = rand(1..20)
    end
    #regresa el reporte lleno
    @reporte
  end
  #metodo para saber el estado de las tortas
  def reporte_tortas
    #contadores para saber cuantas tortas hay de cada tipo de coccion
    crudas = 0
    casi_lista = 0
    lista = 0
    quemada = 0 
    #mostrara el reporte de como estuvieron las tortas
    #p @reporte
    #itera dentro del reporte para saber la condicion de las tortas
    @reporte.each do |torta|
      #si esta cruda
      if torta.include? "Cruda"
        #aumenta el contador de las crudas
        crudas += 1
      #si esta casi lista
      elsif torta.include? "no esta lista"
        #aumenta el contador de las casi_listas
        casi_lista += 1
      #si esta lista
      elsif torta.include? "esta lista"
        #aumenta el contador de las listas
        lista += 1
      #si esta quemada
      elsif torta.include? "Se quemo"
        #aumenta el contador de las quemadas
        quemada += 1
      end   
    end
    #pone el reporte de las tortas
    puts "total de tortas: #{crudas + casi_lista + lista + quemada}"
    puts "Quemadas: #{quemada}"
    puts "Crudas: #{crudas}"
    puts "Casi listas: #{casi_lista}"
    puts "Listas: #{lista}"
  end

end

#instancia de clases para crear un objeto bandej_tortas con 15 tortas de pavo que
#estaran 14 minutos en el horno
bandeja_tortas = Batch.new(15, "Pavo", 14)
bandeja_tortas_pollo = Batch.new(8, "Pollo", 15)
bandeja_tortas_salchicha = Batch.new(4, "Salchicha", 10)
# bandeja_tortas_huevo = Batch.new(3, "Huevo", 15)
bandeja2 = bandeja_tortas_pollo.torta_to_batch
bandeja1 = bandeja_tortas.torta_to_batch
bandeja3 = bandeja_tortas_salchicha.torta_to_batch
#p bandeja_de_tortas = bandeja.torta_to_batch(5, "Milanesa")
#Se pueden sumar arrays con objetos
horno = Horno.new(bandeja1 + bandeja2 + bandeja3)
horno.cook_batch
horno.reporte_tortas
#La otra forma era crear un nuevo array con las bandejas que seria asi:
#total_tortas = [bandeja1, bandeja2, bandeja3]






