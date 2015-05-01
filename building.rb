require './elevator.rb'
require './floor.rb'
require './person.rb'

class Building
  attr_reader :number_of_floors 
  
  def initialize(nFloors, sim)
    @number_of_floors = nFloors 
    @elevator = create_elevator(nFloors, sim) #create elevator object
    @floors = create_floors(nFloors, sim) #create floors array
    sim.register(self) #register with simulation class

  end

  def tick
    # people get off and new people get on
    @elevator.open_doors( @floors[@elevator.current_floor] ) #send the floor that the elevator is currently on
    # move the elevator
    if @elevator.going_up
      @elevator.up
    else
      @elevator.down
    end
  end

  def to_s
    puts "----------------------------------------------------------------------------"
    i = @number_of_floors - 1
    while(i >= 0)
      print "Floor #{i} #{@floors[i].to_s} " 
      if @elevator.current_floor == i 
        print "#{@elevator.to_s}"
      end
      puts
      i-=1
    end
    puts "----------------------------------------------------------------------------"
  end

  private

  def create_floors(n, sim)
    floors = []
    (0..n-1).each do |i| #create each floor 
      floors[i] = Floor.new(i) 
      sim.register(floors[i]) #register floor with simulation class
    end
    return floors
  end

  def create_elevator(nFloors, sim)
    e = Elevator.new(nFloors) #create the elevator sending the number of floors in the building
    sim.register(e) #register with simulation class
    return e
  end
end