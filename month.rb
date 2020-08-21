
class Month
  protected
  attr_reader :name, :days

  def initialize(name, days)
    @name = name
    @days = days
    @events = Array.new(days+1, nil)
    for i in 1..@days do 
      @events[i] = Hash.new
    end
  end

  def add(day, event_name, event_desc)    
    if @events[day].has_key?(event_name)
      puts "Event with the same name already exits on #{day} of #{@name}."
      added = false
    else
      @events[day][event_name] = event_desc
      puts "Event added successfully on #{day} of #{@name}."
      added = true
    end
    return added
  end

  def remove(day, event_name)
    if @events[day].has_key?(event_name)
      @events[day].delete(event_name)
      puts "Event removed successfully."
      removed = true
    else   
      puts "No such event exits on #{day} of #{@name}."
      removed = false
    end
    return removed
  end

  def edit(day, event_name, event_desc)
    if @events[day].has_key?(event_name)
      @events[day].delete(event_name)
      @events[day][event_name] = event_desc
      puts "Event edited successfully."
      edited = true
    else   
      puts "No such event exits on #{day} of #{@name}."
      edited = false
    end    
    return edited
  end

  def show
    puts "\n#{@name}\n\n"
    for day in 1..@days do 
      print "#{day}: #{@events[day].length}\t"
      if day%7 == 0 then puts end
    end
    puts
  end

  def show_day(day) 
    if @events[day].size > 0 
      puts "\n\t#{day} of #{@name}\n\n"
      i = 1
      @events[day].each do |key, value|
        print "#{i}.\tEvent Name: #{key}"
        print "\tEvent Description: #{value}"
        i += 1
      end
    end
  end

  def print_events
    i = 1
    for i in 1..@days 
      show_day(i)
    end
  end

  def check_event(event_name)
    for day in 1..@days do
      if @events[day].size > 0 
        @events[day].each do |key, value|
          if key.eql?(event_name) == true
            return true
          end
        end
      end
    end
    return false
  end

end