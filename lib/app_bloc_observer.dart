import 'package:bloc/bloc.dart';
import 'package:flutter_movie_db/utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.logError('${bloc.runtimeType} error: $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      AppLogger.logDebug('${bloc.runtimeType} change: {\n'
          '> Current event: ${change.currentState}\n'
          '> Next state: ${change.nextState}\n'
          '}');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    AppLogger.logDebug('${bloc.runtimeType} transition: {\n'
        '> Event: ${transition.event}\n'
        '> Current state: ${transition.currentState}\n'
        '> Next state: ${transition.nextState}\n'
        '}');
  }
}
