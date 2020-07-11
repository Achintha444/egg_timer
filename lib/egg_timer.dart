import 'dart:async';

class EggTimer {
  EggTimer({
    Duration maxTime,
    Function onTimeUpdated,
  })  : _maxTime = maxTime,
        _onTimeUpdated = onTimeUpdated;

  final Duration _maxTime;
  final Function _onTimeUpdated;
  final Stopwatch stopwatch = new Stopwatch();
  Duration _currentTime = Duration(minutes: 0);
  Duration _lastStartTime = Duration(minutes: 0);
  EggTimerState _state = EggTimerState.ready;

  set setCurrentTime(newTime) {
    if (this._state == EggTimerState.ready) {
      this._currentTime = newTime;
      this._lastStartTime = this._currentTime;
    }
  }

  get getMaxTime {
    return this._maxTime;
  }

  get getCurrentTime {
    //return Duration(minutes: 33);
    return this._currentTime;
  }

  get getLastStartTime {
    //return Duration(minutes: 33);
    return this._lastStartTime;
  }

  get getState {
    return this._state;
  }

  resume() {
    if (this._state != EggTimerState.running) {
      this._state = EggTimerState.running;

      stopwatch.start();
      this._tick();
    }
  }

  pause() {
    if (this._state == EggTimerState.running) {
      this._state = EggTimerState.paused;
      stopwatch.stop();

      if (this._onTimeUpdated != null) {
        this._onTimeUpdated();
      }
    }
  }

  restart() {
    if(this._state == EggTimerState.paused){
      this._state = EggTimerState.running;
      this._currentTime = this._lastStartTime;
      stopwatch.reset();
      stopwatch.start();

      _tick();
    }
  }

  reset() {
    if (this._state == EggTimerState.paused) {
      this._state = EggTimerState.ready;
      this._currentTime = Duration(seconds: 0);
      this._lastStartTime = this._currentTime;
      stopwatch.reset();
    }

    if (this._onTimeUpdated != null) {
      this._onTimeUpdated();
    }
  }

  _tick() {
    print("Current Time " + this._currentTime.toString());
    _currentTime = _lastStartTime - stopwatch.elapsed;

    if (_currentTime.inSeconds > 0) {
      new Timer(const Duration(seconds: 1), _tick);
    } else {
      this._state = EggTimerState.ready;
    }

    if (null != this._onTimeUpdated) {
      this._onTimeUpdated();
    }
  }
}

enum EggTimerState {
  ready,
  running,
  paused,
  stop,
}
