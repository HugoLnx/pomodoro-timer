module PomodoroTimer
  class Pomodoro
    attr_reader :running

    def initialize(will_work=false)
      @running = RunningThread.new(will_work)
      return nil
    end

    def show_status
      cycle = @running.cycle
      if cycle.stopped?
        puts "No pomodoro running."
      elsif cycle.break?
        puts "It's break time! (#{format_seconds(cycle.missing_progress)})"
      else
        puts "It's work time! (#{format_seconds(cycle.missing_progress)})"
      end
    end

    def cancel
      @running.kill
    end

    def finished?
      return @running.cycle.stopped?
    end

  private

    def format_seconds(seconds)
      return sprintf("%.2d:%.2d",seconds/60, seconds%60)
    end
  end
end
