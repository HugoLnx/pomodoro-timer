module PomodoroTimer
  class RunningThread
    attr_reader :cycle

    def initialize(will_work=false)
      @will_work = will_work
      @cycle = Cycle::STOPPED

      @thread = Thread.new do
        run
      end
    end

    def run
      if @will_work
        @cycle = Cycle.work
        @cycle.start
      end

      @cycle = Cycle.break
      @cycle.start

      puts "Pomodoro finished!(#{format(Time.now)})"
      @cycle = Cycle::STOPPED
    end

    def kill
      @cycle = Cycle::STOPPED
      @thread.kill
    end

private

    def format(time)
      return time.strftime(PomodoroTimer::TIME_FORMAT)
    end
  end
end
