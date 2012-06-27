$LOAD_PATH << File.dirname(__FILE__)
require 'fixnum'
require 'pomodoro_sprint'

module Pomodoro
  extend self

  def start(what=nil)
    @@sprint ||= nil
    if @@sprint.nil? || @@sprint.finished?
      @@sprint = PomodoroSprint.new(what)
    else
      puts "Exist another pomodoro running!"
    end

    return nil
  end

  def cancel
    @@sprint.cancel
  end

  def status
    @@sprint.show_status
  end
end
