require './building.rb'
require './floor.rb'
require './person.rb'

class Simulation
  attr_reader :building 

  def initialize(nFloors, nPeople)
    @building = nil
    @elevator = nil
    @floors = []
    @total_people = []
    Building.new(nFloors, self) #create building - which creates an elevator and floors
    populate(nPeople) #create people at floors
    load_elevator
  end


  def register(object)
    if object.class == Building
      @building = object
    elsif object.class == Elevator 
      @elevator = object
    elsif object.class == Floor 
      @floors[object.floor_num] = object
    elsif object.class == Person
      @total_people.push(object)
    end

  end

  #create people at a floor and put them in a queue to get on the elevator
  def populate(nPeople)
    @floors[0].enqueue(Person.new(0,1,self))
    @floors[0].enqueue(Person.new(0,3,self))
    @floors[0].enqueue(Person.new(0,4,self))
    @floors[0].enqueue(Person.new(0,3,self))
    @floors[0].enqueue(Person.new(0,4,self))
    @floors[3].enqueue(Person.new(3,1,self))
    @floors[4].enqueue(Person.new(4,2,self))
    @floors[2].enqueue(Person.new(2,0,self))
    @floors[1].enqueue(Person.new(1,4,self))



  end

  # if elevator is not at capacity and the ground floor has people waiting, get on the elevator
  def load_elevator
    while(@elevator.has_room? && @floors[0].is_empty?)
      @elevator.enter(@floors[0].dequeue)
    end
  end

  def run(n)
    while(n > 0)
      @building.tick #alert building of time tick
      puts @building.to_s
      sleep(0.5)
      n-=1
    end
  end

end

s = Simulation.new(5,10)

s.run(13)