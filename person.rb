class Person

  attr_reader :start_floor, :dest_floor 
  def initialize(start_floor, dest_floor,sim)
    @start_floor = start_floor
    @dest_floor  = dest_floor
    sim.register(self)
  end

  def to_s

  	puts "Person: start:#{@start_floor} Dest: #{@dest_floor}"

  end

end