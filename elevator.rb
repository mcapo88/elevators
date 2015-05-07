class Elevator

  @@ELEV_MAX_PERSONS = 6
  @@ELEV_RESTING_FLOOR = 0

  attr_reader :current_floor, :going_up
  def initialize(max)
    @max_floor = max-1
    @current_floor = 0
    @going_up = true
    @people = []
  end

  def enter(person)
    if(@people.length < @@ELEV_MAX_PERSONS)
        @people.push(person)
        puts "Enter: #{@people}"
    end
  end

  def exit(person)
    @people.delete(person)
    puts "Exit: #{person}"
  end

  def up
    if(@current_floor < @max_floor)
      @current_floor += 1
    else
      @going_up = false
      @current_floor -= 1
    end
  end

  def down
    if(@current_floor > 0)
      @current_floor -= 1
    else
      @going_up = true
      @current_floor += 1
    end
  end

  def has_room?
    #puts "people length is #{@people.length} & max is #{@@ELEV_MAX_PERSONS - 1} this is #{@people.length < @@ELEV_MAX_PERSONS - 1}"
    return @people.length < @@ELEV_MAX_PERSONS - 1
  end

  def open_doors(floor)
    # get out
    @people.each do |p|
      unless p.nil?
        if(p.dest_floor == @current_floor)
          exit(p)
        end
      end
    end

    # get in
    while(floor.is_empty? && has_room?) 
      enter(floor.dequeue)
    end
  end

  def to_s
    puts "People on the elevator: #{@people.length}"
  end


end
