class PomodoroSprint
  BEEP_SOUND = "resources/ding.wav"
  WORK_TIME = 5#25.minutes
  BREAK_TIME = 5.minutes

  def initialize(what)
    @start = Time.now
    @thread = Thread.new do
      @work_progress = Time.now
      if what.to_s != "break"
        puts "It's work time! (#{format(@work_progress)})"
        while @work_progress - @start < WORK_TIME
          @work_progress = Time.now
          sleep 1
        end
        beep
      end

      puts "It's break time!(#{format(@work_progress)})"
      @break_progress = Time.now
      while @break_progress - @work_progress < BREAK_TIME
        @break_progress = Time.now
        sleep 1
      end

      puts "Pomodoro finished!(#{format(@break_progress)})"

      beep
      @finished = true
    end
    return nil
  end

  def show_status
    if @finished
      puts "It's done"
    elsif @break_progress
      puts "It's break time! (#{format_seconds(BREAK_TIME - (@break_progress-@work_progress))})"
    else
      puts "It's work time! (#{format_seconds(WORK_TIME - (@work_progress-@start))})"
    end
  end

  def cancel
    @thread.kill
    @finished = true
  end

  def finished?
    return @finished
  end

private

  def format(time)
    return time.strftime("%H:%M")
  end

  def format_seconds(seconds)
    return sprintf("%.2d:%.2d",seconds/60, seconds%60)
  end

  def beep
    system "aplay #{File.join(File.dirname(__FILE__),"../#{BEEP_SOUND}")} --quiet"
  end
end
