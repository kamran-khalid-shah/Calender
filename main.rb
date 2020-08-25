# frozen_string_literal: true

require_relative 'calender'
require_relative 'month'

calender = Calender.new

loop do
  print "\nSelect an option:
  1. Add an event.
  2. Remove an event.
  3. Edit an event.
  4. Print a month.
  5. Print a date.
  6. Print all events in a month.
  7. Exit.

  Option: "
  choice = gets
  choice = choice.to_i
  case choice
  when 1
    print "\nEnter month: "
    month = gets
    print 'Enter day: '
    day = gets
    print 'Enter Event name: '
    event_name = gets
    print 'Enter Event description: '
    event_desc = gets
    calender.add_event(Time.new(2020, month.to_i, day.to_i), event_name, event_desc)
  when 2
    print "\nEnter month: "
    month = gets
    print 'Enter day: '
    day = gets
    print 'Enter Event name: '
    event_name = gets
    calender.remove_event(Time.new(2020, month.to_i, day.to_i), event_name)
  when 3
    print "\nEnter month: "
    month = gets
    print 'Enter day: '
    day = gets
    print 'Enter Event name: '
    event_name = gets
    print 'Enter Event description: '
    event_desc = gets
    calender.edit_event(Time.new(2020, month.to_i, day.to_i), event_name, event_desc)
  when 4
    print 'Enter the month to print: '
    month = gets
    if month.to_i.zero?
      calender.print_month(month)
    else
      calender.print_month(month.to_i)
    end
  when 5
    print 'Enter the month: '
    month = gets
    print 'Enter the day: '
    day = gets
    if month.to_i.zero? || day.to_i.zero?
      puts 'Error: Invalid input!'
    else
      calender.print_day(month.to_i, day.to_i)
    end
  when 6
    print 'Enter the month: '
    month = gets
    if month.to_i.zero?
      puts 'Error: Invalid input!'
    else
      calender.print_events_month(month.to_i)
    end
  when 7
    puts 'Exiting'
    break
  else
    'Error: Invalid choice'
  end
end
