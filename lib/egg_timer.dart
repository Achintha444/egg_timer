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
    }
  }

  get getMaxTime {
    return this._maxTime;
  }

  get getCurrentTime {
    //return Duration(minutes: 33);
    return this._currentTime;
  }

  resume() {
    this._state = EggTimerState.running;
    this._lastStartTime = this._currentTime;
    stopwatch.start();
    this._tick();
  }

  pause() {}

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
  stop,
}
