
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
    if month < 0 or month > 12
      puts "Error: Invalid month entered!"
      return false
    end
    @months[month].show()
    return true
  end

  def print_day(month, day)
    if month < 0 or month > 12 or @months[month].days < day or day < 0
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
    return @months[date.month].add(date.day, event_name, event_desc)
  end

  def remove_event(date, event_name)
    return @months[date.month].remove(date.day, event_name)
  end

  def edit_event(date, event_name, event_desc)
    @months[date.month].edit(date.day, event_name, event_desc)
  end

end