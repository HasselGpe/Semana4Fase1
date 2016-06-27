class Torteria
  attr_accessor :minutos_Torteria, :bandeja
  def initialize(start_tiempo)
    @start_tiempo = start_tiempo
    @minutos_Torteria = 0
    @bandeja = [] 
    @tortas_status = {}
  end
  def entrada
    15.times do
      @bandeja << Torta.new
    end
  end

  def tiempo_de_horneado
    while @minutos_Torteria <= @start_tiempo
      @reporte = []
      puts "Minuto #{@minutos_Torteria}"
      puts "*" * 15
      reporte = @bandeja.map do |torta|
        if torta.tiempo == @minutos_Torteria
          "#{torta.type} lista"
        elsif torta.tiempo < @minutos_Torteria
          "#{torta.type} quemada" 
        elsif @minutos_Torteria == 0
          "#{torta.type} cruda"
        elsif @minutos_Torteria > 0 && minutos_Torteria < torta.tiempo
          "#{torta.type} en proceso"
        else
           'NA'
        end
      end
      @minutos_Torteria += 1
    end
    reporte
  end
    def formato_de_reporte
      puts
      puts "Pedidos"
      puts "*" * 15
      puts @reporte
      tiempo_de_horneado
    end
   def tortas_listas
     if @reporte.include?('lista')
       true
     else
       false
     end
   end
   def salida
     raise Error33, "No hay tortas listas todavía" unless self.tortas_listas
     @bandeja.pop
   end   
end
class Torta
  attr_accessor :tiempo, :type
  def initialize
    @type = tipo_torta.keys.sample
    @tiempo = tipo_torta[@type]
  end
    
  def tipo_torta
    {"Cubana" => 15, "Jamon" => 10, "Rusa" => 5}
  end
end  
h = Torteria.new(15)
h.entrada
puts h.formato_de_reporte