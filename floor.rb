class Floor

  attr_reader :floor_num, :persons

  def initialize(num)
    @persons = []
    @floor_num = num
  end

  #add a person to a floor's waiting queue
  def enqueue(person)

    @persons.push(person)
    puts "Enqueue #{@persons}"
  end

  #remove a person froma floor's waiting queue
  def dequeue
        #puts "#{@persons[0]} is at position 0 on this floor number #{@floor_num}"
        #if @persons[0].class == Person
         @persons.delete_at(0)
        #end 
  end

  def is_empty?
    #puts "person length is #{@persons.length} this is #{@persons.length > 0}" 
    @persons.length > 0
  end

  def to_s
    print "#{@persons.length} waiting \t"
    #puts @persons.collect{|x| [x.start_floor, x.dest_floor]}
  end

end