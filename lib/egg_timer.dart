class EggTimer {
  EggTimer({
    Duration maxTime,
  }) : _maxTime = maxTime;

  final Duration _maxTime;
  Duration _currentTime = Duration(minutes: 0);
  EggTimerState _state = EggTimerState.ready;

  set setCurrentTime(newTime){
    if(this._state == EggTimerState.ready){
      this._currentTime = newTime;
    }
  }

  get getMaxTime{
    return this._maxTime;
  }

  get getCurrentTime{
    //return Duration(minutes: 33);
    return this._currentTime;
  }

}

enum EggTimerState {
  ready,
  running,
  stop,
}
