require 'fixnum'
require 'pomodoro_timer/pomodoro'
require 'pomodoro_timer/running_thread'
require 'pomodoro_timer/cycle'
require 'pomodoro_timer/version'

module PomodoroTimer
  extend self

  TIME_FORMAT = "%H:%M"

  def start(what=nil)
    @@pomodoro ||= nil
    if @@pomodoro.nil? || @@pomodoro.finished?
      @@pomodoro = Pomodoro.new(what!=Cycle::BREAK_NAME)
    else
      puts "Exist another pomodoro running!"
    end

    return nil
  end

  def cancel
    @@pomodoro.cancel
  end

  def status
    @@pomodoro.show_status
  end
end
