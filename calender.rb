require_relative 'month'

class Calender < Month 

  def initialize
    @months = Array.new
    @months[1] = Month.new(:January, 31)  
    @months[2] = Month.new(:February, 28)  
    @months[3] = Month.new(:March, 31)  
    @months[4] = Month.new(:April, 30)  
    @months[5] = Month.new(:May, 31)  
    @months[6] = Month.new(:June, 30)  
    @months[7] = Month.new(:July, 31)  
    @months[8] = Month.new(:August, 31)  
    @months[9] = Month.new(:September, 30)  
    @months[10] = Month.new(:October, 31)  
    @months[11] = Month.new(:November, 30)  
    @months[12] = Month.new(:December, 31)
  end

  def check_event(event_name)
    for i in 1..12 do
      if @months[i].check_event(event_name) == true
        return true
      end
    end    
    return false
  end

  def print_month(month)
    if month < 1 or month > 12
      puts "Error: Invalid month entered!"
      return false
    end
    @months[month].show()
    return true
  end

  def print_day(month, day)
    if month < 1 or month > 12 or @months[month].days < day or day < 1
      puts "Error: Invalid value entered!"
      return false
    end
    @months[month].show_day(day)
    return true
  end

  def print_events_month(month)
    return @months[month].print_events
  end

  def add_event(date, event_name, event_desc)
    if event_name.class == String and event_desc.class == String
      return @months[date.month].add(date.day, event_name, event_desc)
    else
      puts "Error: Invalid arguements in add_event"
      return false
    end
  end

  def remove_event(date, event_name)
    if event_name.class == String
      return @months[date.month].remove(date.day, event_name)
    else
      puts "Error: Invalid arguements in remove_event"
      return false
    end
  end

  def edit_event(date, event_name, event_desc)
    if event_name.class == String and event_desc.class == String
      return @months[date.month].edit(date.day, event_name, event_desc)
    else
      puts "Error: Invalid arguements in edit_event"
      return false
    end
  end

end