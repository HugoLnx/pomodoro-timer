# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pomodoro_timer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hugo Roque"]
  gem.email         = ["hugolnx@gmail.com"]
  gem.description   = %q{Helps handle your pomodoro time.}
  gem.summary       = "pomodoro_timer (#{PomodoroTimer::VERSION})"
  gem.homepage      = "https://github.com/hugolnx/pomodoro-timer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pomodoro_timer"
  gem.require_paths = ["lib"]
  gem.version       = PomodoroTimer::VERSION
end
