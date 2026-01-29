// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ytnkio/blocs/bloc_exports.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/blocs/survey/survey_bloc.dart';

class DefaultBlocObserver extends BlocObserver {
  final showEvent = true;
  final showTransition = true;
  final showError = true;
  final showCreate = true;
  final showChange = true;
  final showClose = true;

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showEvent) {
      print(event);
    }
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showTransition) {
      print(_formattedTransitionInfo(bloc, transition));
    }
    super.onTransition(bloc, transition);
  }

  @override
  Future<void> onError(
      BlocBase bloc, Object error, StackTrace stackTrace) async {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showError) {
      print(error);
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showCreate) {
      print(bloc);
    }
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showChange) {
      print(change);
    }

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    if (bloc is SurveyBloc) {
      return;
    }

    if (kDebugMode && showClose) {
      print(bloc);
    }
    super.onClose(bloc);
  }

  String _formattedTransitionInfo(Bloc bloc, Transition transition) {
    const divider =
        '------------------------------------------------------------';

    _getStateDifferences(transition.currentState, transition.nextState);

    return '''

$divider
Event:        ${transition.event}
      
${_getStateDifferences(transition.currentState, transition.nextState)}
$divider
''';
  }

  String _getStateDifferences(GlobalState currentState, GlobalState nextState) {
    String sortedCurrentJson = const JsonEncoder.withIndent('  ')
        .convert(_sortKeys(currentState.toMap()));
    String sortedNextJson = const JsonEncoder.withIndent('  ')
        .convert(_sortKeys(nextState.toMap()));

    // Split the JSON strings into lines
    List<String> currentLines = LineSplitter.split(sortedCurrentJson).toList();
    List<String> nextLines = LineSplitter.split(sortedNextJson).toList();

    // Find differences line by line
    final buffer = StringBuffer();

    int maxLines = currentLines.length > nextLines.length
        ? currentLines.length
        : nextLines.length;
    for (int i = 0; i < maxLines; i++) {
      String currentLine = i < currentLines.length ? currentLines[i] : '';
      String nextLine = i < nextLines.length ? nextLines[i] : '';

      if (currentLine != nextLine) {
        if (currentLine.isNotEmpty) {
          buffer.writeln('Current: $currentLine');
        }
        if (nextLine.isNotEmpty) {
          buffer.writeln('Next:    $nextLine');
        }
      }
    }

    if (buffer.isEmpty) {
      buffer.writeln('No differences');
    }

    return buffer.toString();
  }

  Map<String, dynamic> _sortKeys(Map<String, dynamic> map) {
    var sortedMap = Map<String, dynamic>.fromEntries(
      map.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );

    sortedMap.updateAll((key, value) {
      if (value is Map<String, dynamic>) {
        return _sortKeys(value);
      } else if (value is List) {
        return value.map((item) {
          if (item is Map<String, dynamic>) {
            return _sortKeys(item);
          }
          return item;
        }).toList();
      } else if (value is DateTime) {
        return value.toIso8601String();
      }

      return value;
    });

    return sortedMap;
  }
}
