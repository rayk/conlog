library log_api;

import 'package:conlog/src/log_framework/common_types.dart';
export 'package:conlog/src/log_framework/common_types.dart';

/// Returns a LogIt which is the only thing that is needed to create logging message.
///
/// You provide the scribe function as must information as you can about the context
/// being the subject, which is enumerated. Within an interaction of block of code you
/// may notice many subjects. But that is the big one, what is the reason all these
/// little classes (subjects) are interacting.
///
/// Optionally you can give subject a non case sensitive non-unique name and or
/// unique identifier. In essence you are telling the scribe about the subject
/// which they are scribing about.
///
/// The LogIt returned by the scribe now knows about this character (Subject) in
/// you application. Ask scribe again about the same entity will result in the same
/// LogIt being returned to you.
///
/// Scribes knows only about the LogIt within it own memory space. It maintains
/// that knowledge for the life of the memory space.
LogIt scribe(Subject subject, {String nameLabel, String identifier}) {
  // isLogProcessorOnline. -> Tune Log Processing Service
  // isLogIt Existing. -> retrieve or create
  //
  // Create LogIt, get entity details, isolate details, channel ro processor
  // Make LogIt and Return.
}

/// The LogIt class which provided by scribe is used like a function, calling it
/// with a the combination of parameters caused a log message to appear which is
/// in with the logging configurations and rules which scribe loaded itself.
///
/// The first enum to select it the predicate, this a verb action, that must be
/// true. For example lets use say you used the predicate ```Calculating```,  as
/// long as you can say by the time the LogIt line is called with this predicate
/// a you have a future in hand or a message has been send. You will end up with
/// a valid log entry.
///
/// For example lets say what your synchronous you would never use the  "ing"
/// predicate. Because when the LogIt line is executed it can only before something
/// is done or after it. ```Started```, the first line has executed of the subject
/// alternatively '''About To Start``` if first line of the subject is expect to
/// execute after the call to LogIt.
///
/// The complete collection of predicates have quick documentation so you find it
/// easy pick the correct only.
class LogIt {
  int _sequenceNumber;
  String _currentIsolate;
  Subject _subjectType;
  String _subjectLabel;
  String _subjectIdentifier;

  get subjectLabel => _subjectLabel;
  get subjectId => _subjectIdentifier;
  get subjectType => _subjectType;

  void call(Act action,
      {String actionLabel,
      String actionParameters,
      DirectObject object,
      String directObjectLabel,
      Subject subject,
      LogIt logSubject,
      StackTrace stackTrace}) {
    /// Enhance Details
    /// Dispatch to processor.
  }
}


_dispatch(Map message){

}
