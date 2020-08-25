# frozen_string_literal: true

require_relative 'month'

# Class of calender
class Calender < Month
  def initialize
    @months = [
      Month.new(:January, 31), Month.new(:February, 28),
      Month.new(:March, 31), Month.new(:April, 30),
      Month.new(:May, 31), Month.new(:June, 30),
      Month.new(:July, 31), Month.new(:August, 31),
      Month.new(:September, 30), Month.new(:October, 31),
      Month.new(:November, 30), Month.new(:December, 31)
    ]
  end

  def check_event(event_name)
    @months.each do |month|
      return true if month&.check_event(event_name)
    end
    false
  end

  def print_month(month)
    if month < 1 || month > 12
      puts 'Error: Invalid month entered!'
      return false
    end
    @months[month - 1].show
    true
  end

  def print_day(month, day)
    if month < 1 || month > 12 || @months[month - 1].days + 1 < day || day < 1
      puts 'Error: Invalid value entered!'
      return false
    end
    @months[month - 1].show_day(day - 1)
    true
  end

  def print_events_month(month)
    @months[month - 1].print_events
  end

  def add_event(date, event_name, event_desc)
    added = @months[date.month - 1].add(date.day - 1, event_name, event_desc)
    return added if event_name.class == String && event_desc.class == String

    puts 'Error: Invalid arguements in add_event'
    false
  end

  def remove_event(date, event_name)
    removed = @months[date.month - 1].remove(date.day - 1, event_name)
    return removed if event_name.class == String

    puts 'Error: Invalid arguements in remove_event'
    false
  end

  def edit_event(date, event_name, event_desc)
    edited = @months[date.month - 1].edit(date.day - 1, event_name, event_desc)
    return edited if event_name.class == String && event_desc.class == String

    puts 'Error: Invalid arguements in edit_event'
    false
  end
end

Calender.new.check_event('test')
