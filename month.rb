# frozen_string_literal: true

# Class of month
class Month
  protected

  attr_reader :name, :days

  def initialize(name, days)
    @name = name
    @days = days
    @events = Array.new(days, nil)
  end

  def add(day, event_name, event_desc)
    if @events[day]&.key?(event_name)
      puts "\nEvent with the same name already exits on #{day + 1} of #{@name}."
      added = false
    else
      @events[day] = {} if @events[day].nil?
      @events[day][event_name] = event_desc
      puts "\nEvent added successfully on #{day + 1} of #{@name}."
      added = true
    end
    added
  end

  def remove(day, event_name)
    if @events[day]&.key?(event_name)
      @events[day].delete(event_name)
      puts 'Event removed successfully.'
      removed = true
    else
      puts "\nNo such event exits on #{day + 1} of #{@name}."
      removed = false
    end
    removed
  end

  def edit(day, event_name, event_desc)
    if @events[day]&.key?(event_name)
      @events[day].delete(event_name)
      @events[day][event_name] = event_desc
      puts 'Event edited successfully.'
      edited = true
    else
      puts "\nNo such event exits on #{day + 1} of #{@name}."
      edited = false
    end
    edited
  end

  def show
    puts "\n#{@name}\n\n"
    @days.times do |day|
      length = @events[day]&.length
      length = 0 if length.nil?
      print "#{day + 1}: #{length}\t"
      puts if ((day + 1) % 7).zero?
    end
    puts
  end

  def show_day(day)
    puts "\n\t#{day + 1} of #{@name}\n\n" if @events[day]
    i = 1
    @events[day]&.each do |key, value|
      print "#{i}.\tEvent Name: #{key}"
      print "\tEvent Description: #{value}"
      i += 1
    end
  end

  def print_events
    @days.times do |day|
      show_day(day)
    end
  end

  def check_event(event_name)
    @days.times do |day|
      @events[day]&.each do |key, value|
        return true if key.eql?(event_name)
      end
    end
    false
  end
end
