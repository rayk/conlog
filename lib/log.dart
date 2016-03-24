/// ### Logging Library
///
/// Missing leading logs entry and sparse instrumentation is common. It has been a problem for some decades; the old argument is that engineers need to be more disciplined, is dragged out to explain the problem away. Well, certainly I have used that line over the years.
///
///I am starting to believe it is not true.
///
///My anally retentive nature over logging has driven pairing partner and team members to despair. With all this focus on logging, I still have log entries in recently written code that do not meet my standards. The bottom line is a log should not lie or mislead; it needs to provide context, and that is relevant to the situation.
///
///The problem is one needs to write a log entry for the future; it requires a context switch. Which breaks coding rhythm, to preserve our rhythm we create the entry in the present tense which does not also ways lead to an entry at the right level, in the correct context that affords a validate description of the codes behaviour.
///
///Then using logging statements as a debug tool does not help this, that is the role of the debuggers and your IDE. Having [proper](https://api.dartlang.org/stable/1.15.0/dart-developer/dart-developer-library.html) tooling integration like [we do](https://dart-lang.github.io/observatory/) does reduce the risk of this.
///
//So this package is about exploring how to deliver meaningful and correct logging without the developer having to see into the future for the scenarios where a correctly composed entry could save hours and the course of history.
///
//The ergonomic goal of this logging command is for there zero flow interruption in the creation of the message. It should not add to the noise of the code; it should be reinforcing the intent of the code.
///
//From a performance angle, there should a minimal impact, in time and space complexity.
///
//let us see what happens.
library log;

export 'package:conlog/src/log_api.dart';