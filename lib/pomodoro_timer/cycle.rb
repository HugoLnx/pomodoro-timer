module PomodoroTimer
  class Cycle
    attr_reader :name
    attr_accessor :progress

    BEEP_SOUND = "resources/ding.wav"
    STOPPED = Cycle.new

    WORK_NAME = :work
    BREAK_NAME = :break

    WARNINGS = {
      WORK_NAME => "It's work time!",
      BREAK_NAME => "It's break time!"
    }

    LIMITS = {
      WORK_NAME => 25,#25.minutes,
      BREAK_NAME => 5#5.minutes
    }

    class << self
      def break
        Cycle.new(BREAK_NAME)
      end

      def work
        Cycle.new(WORK_NAME)
      end
    end

    def initialize(name)
      @name = name
      @progress = 0.0
    end

    def start
      started = Time.now

      puts "#{WARNINGS[@name]} (#{format(started)})"

      while @progress < LIMITS[@name]
        @progress = Time.now - started
        sleep 1
      end

      beep
    end

    def missing_progress
      return LIMITS[@name] - @progress
    end

    def break?
      return @name == :break
    end

    def work?
      return @name == :work
    end

    def stopped?
      return self == STOPPED
    end

  private

    def format(time)
      return time.strftime(PomodoroTimer::TIME_FORMAT)
    end

    def beep
      system "aplay #{File.join(File.dirname(__FILE__),"../../#{BEEP_SOUND}")} --quiet"
    end
  end
end
