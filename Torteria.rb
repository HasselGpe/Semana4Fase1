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
  def torta_to_batch
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
  def cook_batch
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
      #si esta cruda
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
    puts "total de tortas: #{crudas + casi_lista + lista + quemada}"
    puts "Quemadas: #{quemada}"
    puts "Crudas: #{crudas}"
    puts "Casi listas: #{casi_lista}"
    puts "Listas: #{lista}"
  end
end
bandeja_tortas = Batch.new(15, "Pavo", 14)
bandeja_tortas_pollo = Batch.new(8, "Pollo", 15)
bandeja_tortas_salchicha = Batch.new(4, "Salchicha", 10)
bandeja2 = bandeja_tortas_pollo.torta_to_batch
bandeja1 = bandeja_tortas.torta_to_batch
bandeja3 = bandeja_tortas_salchicha.torta_to_batch
horno = Horno.new(bandeja1 + bandeja2 + bandeja3)
horno.cook_batch
horno.reporte_tortas







