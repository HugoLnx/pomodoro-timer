# Pomodoro Timer #
***
### Description ###
A simple project to count your pomodoros time.

### How use it ###
First of all, install it...
    gem install pomodoro-timer

After that you can open irb, require and include:
    require 'rubygems'
    require 'pomodoro_timer'
    include PomodoroTimer 


Now you have the methods:
* start: Start one pomodoro "sprint".
* status: Show if you are in break or work time and how much least to end.
* cancel: Cancel your pomodoro.


### How it works ###
First: Calling the start method, your 25 minutes of work will start counting.
Second: When this time end a ding sound will be played and your 5 minutes of break will starts counting automaticaly.
Third: When break time ends you have to start another pomodoro manualy, using the start method.


Maybe you will want to ignore the break ding and work a litte more, it's okay, you can cancel the actual pomodoro and when you want take a break you can call the method start passing :break like this...
    start :break

### About me ###
* _Name:_ Hugo Roque
* _Email:_ hugo.roque@caelum.com.br
* _Twitter:_ http://twitter.com/hugolnx
*	_Blog:_ http://hugolnx.com/
*	_Labs:_ http://lnxlabs.heroku.com/
